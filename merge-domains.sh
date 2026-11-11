#!/usr/bin/env bash
# Merge domain-level ad-block sources into one deduplicated DOMAIN-SET file.
# Preserves DOMAIN-SET semantics: bare entry = exact match, .entry = domain+subdomains.
# Sources: skk reject.conf, anti-ad surge.txt, adblocksurge.list, goodbyeads-domain.txt.
# Called by sync.sh and sync-ads.sh after fetching; safe to run standalone.
set -u
cd "$(dirname "$0")"
python3 - <<'PY'
import pathlib

SRC = [
    ('rules/skk/List/domainset/reject.conf', 'set'),
    ('rules/adblock/adblocksurge.list', 'set'),
    ('rules/adblock/goodbyeads-domain.txt', 'set'),
    ('rules/anti-ad/surge.txt', 'rules'),
]
LABEL = r'[a-z0-9_](?:[a-z0-9_-]{0,61}[a-z0-9_])?'
import re
DOM = re.compile(rf'^{LABEL}(?:\.{LABEL})+$')

exact, suffix = set(), set()
rejected, skipped_types = [], {}

def add(form, dom, raw):
    dom = dom.strip().lower().rstrip('.')
    if dom.startswith('*.'): dom = dom[2:]; form = 'suffix'
    elif dom.startswith('*'): dom = dom[1:]; form = 'suffix'
    if not DOM.match(dom):
        rejected.append(raw); return
    (suffix if form == 'suffix' else exact).add(dom)

for path, kind in SRC:
    p = pathlib.Path(path)
    if not p.exists():
        print('skip missing', path); continue
    n_exact = n_suffix = 0
    for raw in p.read_text(encoding='utf-8', errors='replace').splitlines():
        s = raw.strip()
        if not s or s.startswith(('#', '!', '//', ';')):
            continue
        if kind == 'set':
            if s.startswith('.'):
                add('suffix', s[1:], s); n_suffix += 1
            else:
                add('exact', s, s); n_exact += 1
        else:
            parts = s.split(',')
            t = parts[0].strip().upper() if parts else ''
            if t == 'DOMAIN-SUFFIX' and len(parts) >= 2:
                add('suffix', parts[1], s); n_suffix += 1
            elif t == 'DOMAIN' and len(parts) >= 2:
                add('exact', parts[1], s); n_exact += 1
            elif t in ('DOMAIN-KEYWORD', 'DOMAIN-WILDCARD', 'USER-AGENT',
                       'PROCESS-NAME', 'URL-REGEX', 'IP-CIDR', 'IP-CIDR6',
                       'IP-ASN', 'DEST-PORT', 'AND', 'OR', 'NOT'):
                skipped_types[t] = skipped_types.get(t, 0) + 1
            else:
                rejected.append(s)
    print(f'{path}: exact={n_exact} suffix={n_suffix}')

# suffix .y covers domain d iff d==y or d ends with ".y"  (check d and its parents)
def covered_by_suffix(d):
    parts = d.split('.')
    return any('.'.join(parts[i:]) in suffix for i in range(len(parts)))

keep_exact = {e for e in exact if not covered_by_suffix(e)}
# suffix .x is redundant if a proper parent suffix exists
keep_suffix = set()
for x in suffix:
    parts = x.split('.')
    if not any('.'.join(parts[i:]) in suffix for i in range(1, len(parts))):
        keep_suffix.add(x)

out = []
out += ['.' + s for s in sorted(keep_suffix)]
out += sorted(keep_exact)
pathlib.Path('rules/adblock').mkdir(parents=True, exist_ok=True)
pathlib.Path('rules/adblock/reject-merged.conf').write_text('\n'.join(out) + '\n')
print(f'merged -> rules/adblock/reject-merged.conf: {len(out)} entries '
      f'(exact={len(keep_exact)} suffix={len(keep_suffix)})')
print(f'rejected invalid lines: {len(rejected)}; skipped non-domain rule types: {skipped_types}')
for r in rejected[:20]:
    print('  rejected:', r[:100])
PY
