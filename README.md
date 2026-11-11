# surge-rules

Self-hosted mirror of remote rule sources used by the Surge profile `Nico5.7.conf`.

- `rules/skk/` — ruleset.skk.moe rule sets and Mock assets
- `rules/blackmatrix7/` — ios_rule_script Surge rule lists
- `rules/anti-ad/` — anti-ad.net adblock list
- `geoip/Country.mmdb` — GeoIP database

`scripts`/`sync.sh` re-downloads every upstream file; `.github/workflows/sync.yml`
runs it daily via GitHub Actions and commits changes.

Raw base URL: `https://raw.githubusercontent.com/nicolasyang7/surge-rules/main/`
