#!/usr/bin/env bash
# Sync fast-moving ad-block lists only. Called by sync.sh (daily) and sync-ads.yml (every 8h).
set -u
cd "$(dirname "$0")"
fail=0

mkdir -p "$(dirname "rules/adblock/adblocksurge.list")"
if curl -fsSL --max-time 120 -A "Surge" -o "rules/adblock/adblocksurge.list.tmp" "https://raw.githubusercontent.com/217heidai/adblockfilters/main/rules/adblocksurge.list"; then
  mv "rules/adblock/adblocksurge.list.tmp" "rules/adblock/adblocksurge.list"
else
  rm -f "rules/adblock/adblocksurge.list.tmp"
  echo "FAIL rules/adblock/adblocksurge.list"
  fail=1
fi

mkdir -p "$(dirname "rules/adblock/goodbyeads-domain.txt")"
if curl -fsSL --max-time 120 -A "Surge" -o "rules/adblock/goodbyeads-domain.txt.tmp" "https://raw.githubusercontent.com/8680/GOODBYEADS/master/data/rules/ad-domain.txt"; then
  awk '{ s=$0; sub(/\r$/,""); gsub(/^[ \t]+|[ \t]+$/,"");
         if (s=="" || s ~ /^[#!]/) next;
         sub(/^\*\./,".",s); sub(/^\*/,".",s);
         print s }' "rules/adblock/goodbyeads-domain.txt.tmp" > "rules/adblock/goodbyeads-domain.txt"
  rm -f "rules/adblock/goodbyeads-domain.txt.tmp"
else
  rm -f "rules/adblock/goodbyeads-domain.txt.tmp"
  echo "FAIL rules/adblock/goodbyeads-domain.txt"
  fail=1
fi

bash merge-domains.sh || fail=1

if [ "$fail" -eq 0 ]; then echo "ads sync ok"; else echo "some ad downloads failed"; fi
exit $fail
