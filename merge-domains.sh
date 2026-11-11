#!/usr/bin/env bash
# Merge all domain-level ad-block sources into one deduplicated DOMAIN-SET file.
# Sources: skk reject.conf, anti-ad surge.txt, adblocksurge.list, goodbyeads-domain.txt.
# Called by sync.sh and sync-ads.sh after fetching; safe to run standalone.
set -u
cd "$(dirname "$0")"
python3 - <<'PY'
import re, sys, pathlib

SRC = [
    ('rules/skk/List/domainset/reject.conf', False),
    ('rules/adblock/adblocksurge.list', False),
    ('rules/adblock/goodbyeads-domain.txt', False),
    ('rules/anti-ad/surge.txt', True),   # DOMAIN-SUFFIX rules -> take field 2
]
DOM = re.compile(r'^[a-z0-9][a-z0-9.-]*\.[a-z]{2,}$')
domains = set()
for path, is_ruleset in SRC:
    p = pathlib.Path(path)
    if not p.exists():
        print('skip missing', path); continue
    n = 0
    for line in p.read_text(encoding='utf-8', errors='replace').splitlines():
        s = line.strip()
        if not s or s.startswith('#') or s.startswith('!'):
            continue
        if is_ruleset:
            if not s.startswith('DOMAIN-SUFFIX,'):
                continue
            s = s.split(',', 2)[1]
        s = s.lstrip('.').lstrip('*').lower()
        if s.startswith('||'):
            s = s[2:]
        s = s.rstrip('.')
        if DOM.match(s):
            domains.add('.' + s); n += 1
    print(f'{path}: {n} entries')
out = pathlib.Path('rules/adblock/reject-merged.conf')
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text('\n'.join(sorted(domains)) + '\n')
print(f'merged -> {out}: {len(domains)} unique domains')
PY
