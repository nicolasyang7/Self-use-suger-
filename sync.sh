#!/usr/bin/env bash
# Sync upstream rule sources into this repo. Safe to run manually or via GitHub Actions.
set -u
cd "$(dirname "$0")"
fail=0
mkdir -p "$(dirname "geoip/Country.mmdb")"
if curl -fsSL --max-time 60 -A "Surge" -o "geoip/Country.mmdb.tmp" "https://github.com/Hackl0us/GeoIP2-CN/raw/release/Country.mmdb"; then
  mv "geoip/Country.mmdb.tmp" "geoip/Country.mmdb"
else
  rm -f "geoip/Country.mmdb.tmp"
  echo "FAIL geoip/Country.mmdb"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/non_ip/lan.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/non_ip/lan.conf.tmp" "https://ruleset.skk.moe/List/non_ip/lan.conf"; then
  mv "rules/skk/List/non_ip/lan.conf.tmp" "rules/skk/List/non_ip/lan.conf"
else
  rm -f "rules/skk/List/non_ip/lan.conf.tmp"
  echo "FAIL rules/skk/List/non_ip/lan.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/ip/lan.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/ip/lan.conf.tmp" "https://ruleset.skk.moe/List/ip/lan.conf"; then
  mv "rules/skk/List/ip/lan.conf.tmp" "rules/skk/List/ip/lan.conf"
else
  rm -f "rules/skk/List/ip/lan.conf.tmp"
  echo "FAIL rules/skk/List/ip/lan.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/anti-ad/surge.txt")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/anti-ad/surge.txt.tmp" "https://anti-ad.net/surge.txt"; then
  mv "rules/anti-ad/surge.txt.tmp" "rules/anti-ad/surge.txt"
else
  rm -f "rules/anti-ad/surge.txt.tmp"
  echo "FAIL rules/anti-ad/surge.txt"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/domainset/reject.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/domainset/reject.conf.tmp" "https://ruleset.skk.moe/List/domainset/reject.conf"; then
  mv "rules/skk/List/domainset/reject.conf.tmp" "rules/skk/List/domainset/reject.conf"
else
  rm -f "rules/skk/List/domainset/reject.conf.tmp"
  echo "FAIL rules/skk/List/domainset/reject.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/non_ip/my_reject.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/non_ip/my_reject.conf.tmp" "https://ruleset.skk.moe/List/non_ip/my_reject.conf"; then
  mv "rules/skk/List/non_ip/my_reject.conf.tmp" "rules/skk/List/non_ip/my_reject.conf"
else
  rm -f "rules/skk/List/non_ip/my_reject.conf.tmp"
  echo "FAIL rules/skk/List/non_ip/my_reject.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/ip/reject.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/ip/reject.conf.tmp" "https://ruleset.skk.moe/List/ip/reject.conf"; then
  mv "rules/skk/List/ip/reject.conf.tmp" "rules/skk/List/ip/reject.conf"
else
  rm -f "rules/skk/List/ip/reject.conf.tmp"
  echo "FAIL rules/skk/List/ip/reject.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/non_ip/ai.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/non_ip/ai.conf.tmp" "https://ruleset.skk.moe/List/non_ip/ai.conf"; then
  mv "rules/skk/List/non_ip/ai.conf.tmp" "rules/skk/List/non_ip/ai.conf"
else
  rm -f "rules/skk/List/non_ip/ai.conf.tmp"
  echo "FAIL rules/skk/List/non_ip/ai.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/non_ip/domestic.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/non_ip/domestic.conf.tmp" "https://ruleset.skk.moe/List/non_ip/domestic.conf"; then
  mv "rules/skk/List/non_ip/domestic.conf.tmp" "rules/skk/List/non_ip/domestic.conf"
else
  rm -f "rules/skk/List/non_ip/domestic.conf.tmp"
  echo "FAIL rules/skk/List/non_ip/domestic.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/domainset/speedtest.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/domainset/speedtest.conf.tmp" "https://ruleset.skk.moe/List/domainset/speedtest.conf"; then
  mv "rules/skk/List/domainset/speedtest.conf.tmp" "rules/skk/List/domainset/speedtest.conf"
else
  rm -f "rules/skk/List/domainset/speedtest.conf.tmp"
  echo "FAIL rules/skk/List/domainset/speedtest.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/AppleTV.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/AppleTV.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/AppleTV/AppleTV.list"; then
  mv "rules/blackmatrix7/AppleTV.list.tmp" "rules/blackmatrix7/AppleTV.list"
else
  rm -f "rules/blackmatrix7/AppleTV.list.tmp"
  echo "FAIL rules/blackmatrix7/AppleTV.list"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/non_ip/apple_services.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/non_ip/apple_services.conf.tmp" "https://ruleset.skk.moe/List/non_ip/apple_services.conf"; then
  mv "rules/skk/List/non_ip/apple_services.conf.tmp" "rules/skk/List/non_ip/apple_services.conf"
else
  rm -f "rules/skk/List/non_ip/apple_services.conf.tmp"
  echo "FAIL rules/skk/List/non_ip/apple_services.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/domainset/apple_cdn.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/domainset/apple_cdn.conf.tmp" "https://ruleset.skk.moe/List/domainset/apple_cdn.conf"; then
  mv "rules/skk/List/domainset/apple_cdn.conf.tmp" "rules/skk/List/domainset/apple_cdn.conf"
else
  rm -f "rules/skk/List/domainset/apple_cdn.conf.tmp"
  echo "FAIL rules/skk/List/domainset/apple_cdn.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/domainset/icloud_private_relay.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/domainset/icloud_private_relay.conf.tmp" "https://ruleset.skk.moe/List/domainset/icloud_private_relay.conf"; then
  mv "rules/skk/List/domainset/icloud_private_relay.conf.tmp" "rules/skk/List/domainset/icloud_private_relay.conf"
else
  rm -f "rules/skk/List/domainset/icloud_private_relay.conf.tmp"
  echo "FAIL rules/skk/List/domainset/icloud_private_relay.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/non_ip/microsoft_cdn.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/non_ip/microsoft_cdn.conf.tmp" "https://ruleset.skk.moe/List/non_ip/microsoft_cdn.conf"; then
  mv "rules/skk/List/non_ip/microsoft_cdn.conf.tmp" "rules/skk/List/non_ip/microsoft_cdn.conf"
else
  rm -f "rules/skk/List/non_ip/microsoft_cdn.conf.tmp"
  echo "FAIL rules/skk/List/non_ip/microsoft_cdn.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/non_ip/microsoft.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/non_ip/microsoft.conf.tmp" "https://ruleset.skk.moe/List/non_ip/microsoft.conf"; then
  mv "rules/skk/List/non_ip/microsoft.conf.tmp" "rules/skk/List/non_ip/microsoft.conf"
else
  rm -f "rules/skk/List/non_ip/microsoft.conf.tmp"
  echo "FAIL rules/skk/List/non_ip/microsoft.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Google.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Google.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Google/Google.list"; then
  mv "rules/blackmatrix7/Google.list.tmp" "rules/blackmatrix7/Google.list"
else
  rm -f "rules/blackmatrix7/Google.list.tmp"
  echo "FAIL rules/blackmatrix7/Google.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/GitHub.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/GitHub.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/GitHub/GitHub.list"; then
  mv "rules/blackmatrix7/GitHub.list.tmp" "rules/blackmatrix7/GitHub.list"
else
  rm -f "rules/blackmatrix7/GitHub.list.tmp"
  echo "FAIL rules/blackmatrix7/GitHub.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/PayPal.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/PayPal.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/PayPal/PayPal.list"; then
  mv "rules/blackmatrix7/PayPal.list.tmp" "rules/blackmatrix7/PayPal.list"
else
  rm -f "rules/blackmatrix7/PayPal.list.tmp"
  echo "FAIL rules/blackmatrix7/PayPal.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Binance.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Binance.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Binance/Binance.list"; then
  mv "rules/blackmatrix7/Binance.list.tmp" "rules/blackmatrix7/Binance.list"
else
  rm -f "rules/blackmatrix7/Binance.list.tmp"
  echo "FAIL rules/blackmatrix7/Binance.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Whatsapp.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Whatsapp.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Whatsapp/Whatsapp.list"; then
  mv "rules/blackmatrix7/Whatsapp.list.tmp" "rules/blackmatrix7/Whatsapp.list"
else
  rm -f "rules/blackmatrix7/Whatsapp.list.tmp"
  echo "FAIL rules/blackmatrix7/Whatsapp.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Telegram.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Telegram.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Telegram/Telegram.list"; then
  mv "rules/blackmatrix7/Telegram.list.tmp" "rules/blackmatrix7/Telegram.list"
else
  rm -f "rules/blackmatrix7/Telegram.list.tmp"
  echo "FAIL rules/blackmatrix7/Telegram.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Instagram.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Instagram.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Instagram/Instagram.list"; then
  mv "rules/blackmatrix7/Instagram.list.tmp" "rules/blackmatrix7/Instagram.list"
else
  rm -f "rules/blackmatrix7/Instagram.list.tmp"
  echo "FAIL rules/blackmatrix7/Instagram.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Twitter.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Twitter.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Twitter/Twitter.list"; then
  mv "rules/blackmatrix7/Twitter.list.tmp" "rules/blackmatrix7/Twitter.list"
else
  rm -f "rules/blackmatrix7/Twitter.list.tmp"
  echo "FAIL rules/blackmatrix7/Twitter.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/YouTube.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/YouTube.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/refs/heads/master/rule/Surge/YouTube/YouTube.list"; then
  mv "rules/blackmatrix7/YouTube.list.tmp" "rules/blackmatrix7/YouTube.list"
else
  rm -f "rules/blackmatrix7/YouTube.list.tmp"
  echo "FAIL rules/blackmatrix7/YouTube.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Netflix.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Netflix.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Netflix/Netflix.list"; then
  mv "rules/blackmatrix7/Netflix.list.tmp" "rules/blackmatrix7/Netflix.list"
else
  rm -f "rules/blackmatrix7/Netflix.list.tmp"
  echo "FAIL rules/blackmatrix7/Netflix.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Disney.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Disney.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Disney/Disney.list"; then
  mv "rules/blackmatrix7/Disney.list.tmp" "rules/blackmatrix7/Disney.list"
else
  rm -f "rules/blackmatrix7/Disney.list.tmp"
  echo "FAIL rules/blackmatrix7/Disney.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Spotify.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Spotify.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Spotify/Spotify.list"; then
  mv "rules/blackmatrix7/Spotify.list.tmp" "rules/blackmatrix7/Spotify.list"
else
  rm -f "rules/blackmatrix7/Spotify.list.tmp"
  echo "FAIL rules/blackmatrix7/Spotify.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/TikTok.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/TikTok.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/TikTok/TikTok.list"; then
  mv "rules/blackmatrix7/TikTok.list.tmp" "rules/blackmatrix7/TikTok.list"
else
  rm -f "rules/blackmatrix7/TikTok.list.tmp"
  echo "FAIL rules/blackmatrix7/TikTok.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/BiliBili.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/BiliBili.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/BiliBili/BiliBili.list"; then
  mv "rules/blackmatrix7/BiliBili.list.tmp" "rules/blackmatrix7/BiliBili.list"
else
  rm -f "rules/blackmatrix7/BiliBili.list.tmp"
  echo "FAIL rules/blackmatrix7/BiliBili.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/ChinaMedia.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/ChinaMedia.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/ChinaMedia/ChinaMedia.list"; then
  mv "rules/blackmatrix7/ChinaMedia.list.tmp" "rules/blackmatrix7/ChinaMedia.list"
else
  rm -f "rules/blackmatrix7/ChinaMedia.list.tmp"
  echo "FAIL rules/blackmatrix7/ChinaMedia.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Epic.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Epic.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Epic/Epic.list"; then
  mv "rules/blackmatrix7/Epic.list.tmp" "rules/blackmatrix7/Epic.list"
else
  rm -f "rules/blackmatrix7/Epic.list.tmp"
  echo "FAIL rules/blackmatrix7/Epic.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Sony.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Sony.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Sony/Sony.list"; then
  mv "rules/blackmatrix7/Sony.list.tmp" "rules/blackmatrix7/Sony.list"
else
  rm -f "rules/blackmatrix7/Sony.list.tmp"
  echo "FAIL rules/blackmatrix7/Sony.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Steam.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Steam.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Steam/Steam.list"; then
  mv "rules/blackmatrix7/Steam.list.tmp" "rules/blackmatrix7/Steam.list"
else
  rm -f "rules/blackmatrix7/Steam.list.tmp"
  echo "FAIL rules/blackmatrix7/Steam.list"
  fail=1
fi
mkdir -p "$(dirname "rules/blackmatrix7/Nintendo.list")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/blackmatrix7/Nintendo.list.tmp" "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Surge/Nintendo/Nintendo.list"; then
  mv "rules/blackmatrix7/Nintendo.list.tmp" "rules/blackmatrix7/Nintendo.list"
else
  rm -f "rules/blackmatrix7/Nintendo.list.tmp"
  echo "FAIL rules/blackmatrix7/Nintendo.list"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/domainset/cdn.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/domainset/cdn.conf.tmp" "https://ruleset.skk.moe/List/domainset/cdn.conf"; then
  mv "rules/skk/List/domainset/cdn.conf.tmp" "rules/skk/List/domainset/cdn.conf"
else
  rm -f "rules/skk/List/domainset/cdn.conf.tmp"
  echo "FAIL rules/skk/List/domainset/cdn.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/ip/domestic.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/ip/domestic.conf.tmp" "https://ruleset.skk.moe/List/ip/domestic.conf"; then
  mv "rules/skk/List/ip/domestic.conf.tmp" "rules/skk/List/ip/domestic.conf"
else
  rm -f "rules/skk/List/ip/domestic.conf.tmp"
  echo "FAIL rules/skk/List/ip/domestic.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/List/ip/china_ip.conf")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/List/ip/china_ip.conf.tmp" "https://ruleset.skk.moe/List/ip/china_ip.conf"; then
  mv "rules/skk/List/ip/china_ip.conf.tmp" "rules/skk/List/ip/china_ip.conf"
else
  rm -f "rules/skk/List/ip/china_ip.conf.tmp"
  echo "FAIL rules/skk/List/ip/china_ip.conf"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/www-google-analytics-com_analytics.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/www-google-analytics-com_analytics.js.tmp" "https://ruleset.skk.moe/Mock/www-google-analytics-com_analytics.js"; then
  mv "rules/skk/Mock/www-google-analytics-com_analytics.js.tmp" "rules/skk/Mock/www-google-analytics-com_analytics.js"
else
  rm -f "rules/skk/Mock/www-google-analytics-com_analytics.js.tmp"
  echo "FAIL rules/skk/Mock/www-google-analytics-com_analytics.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/www-google-analytics-com_ga.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/www-google-analytics-com_ga.js.tmp" "https://ruleset.skk.moe/Mock/www-google-analytics-com_ga.js"; then
  mv "rules/skk/Mock/www-google-analytics-com_ga.js.tmp" "rules/skk/Mock/www-google-analytics-com_ga.js"
else
  rm -f "rules/skk/Mock/www-google-analytics-com_ga.js.tmp"
  echo "FAIL rules/skk/Mock/www-google-analytics-com_ga.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/www-google-analytics-com_cx_api.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/www-google-analytics-com_cx_api.js.tmp" "https://ruleset.skk.moe/Mock/www-google-analytics-com_cx_api.js"; then
  mv "rules/skk/Mock/www-google-analytics-com_cx_api.js.tmp" "rules/skk/Mock/www-google-analytics-com_cx_api.js"
else
  rm -f "rules/skk/Mock/www-google-analytics-com_cx_api.js.tmp"
  echo "FAIL rules/skk/Mock/www-google-analytics-com_cx_api.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/www-googlesyndication-com_adsbygoogle.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/www-googlesyndication-com_adsbygoogle.js.tmp" "https://ruleset.skk.moe/Mock/www-googlesyndication-com_adsbygoogle.js"; then
  mv "rules/skk/Mock/www-googlesyndication-com_adsbygoogle.js.tmp" "rules/skk/Mock/www-googlesyndication-com_adsbygoogle.js"
else
  rm -f "rules/skk/Mock/www-googlesyndication-com_adsbygoogle.js.tmp"
  echo "FAIL rules/skk/Mock/www-googlesyndication-com_adsbygoogle.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/www-googletagservices-com_gpt.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/www-googletagservices-com_gpt.js.tmp" "https://ruleset.skk.moe/Mock/www-googletagservices-com_gpt.js"; then
  mv "rules/skk/Mock/www-googletagservices-com_gpt.js.tmp" "rules/skk/Mock/www-googletagservices-com_gpt.js"
else
  rm -f "rules/skk/Mock/www-googletagservices-com_gpt.js.tmp"
  echo "FAIL rules/skk/Mock/www-googletagservices-com_gpt.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/www-google-analytics-com_inpage_linkid.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/www-google-analytics-com_inpage_linkid.js.tmp" "https://ruleset.skk.moe/Mock/www-google-analytics-com_inpage_linkid.js"; then
  mv "rules/skk/Mock/www-google-analytics-com_inpage_linkid.js.tmp" "rules/skk/Mock/www-google-analytics-com_inpage_linkid.js"
else
  rm -f "rules/skk/Mock/www-google-analytics-com_inpage_linkid.js.tmp"
  echo "FAIL rules/skk/Mock/www-google-analytics-com_inpage_linkid.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/doubleclick-net_instream_ad_status.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/doubleclick-net_instream_ad_status.js.tmp" "https://ruleset.skk.moe/Mock/doubleclick-net_instream_ad_status.js"; then
  mv "rules/skk/Mock/doubleclick-net_instream_ad_status.js.tmp" "rules/skk/Mock/doubleclick-net_instream_ad_status.js"
else
  rm -f "rules/skk/Mock/doubleclick-net_instream_ad_status.js.tmp"
  echo "FAIL rules/skk/Mock/doubleclick-net_instream_ad_status.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/ampproject-org_v0.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/ampproject-org_v0.js.tmp" "https://ruleset.skk.moe/Mock/ampproject-org_v0.js"; then
  mv "rules/skk/Mock/ampproject-org_v0.js.tmp" "rules/skk/Mock/ampproject-org_v0.js"
else
  rm -f "rules/skk/Mock/ampproject-org_v0.js.tmp"
  echo "FAIL rules/skk/Mock/ampproject-org_v0.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/addthis-com_addthis_widget.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/addthis-com_addthis_widget.js.tmp" "https://ruleset.skk.moe/Mock/addthis-com_addthis_widget.js"; then
  mv "rules/skk/Mock/addthis-com_addthis_widget.js.tmp" "rules/skk/Mock/addthis-com_addthis_widget.js"
else
  rm -f "rules/skk/Mock/addthis-com_addthis_widget.js.tmp"
  echo "FAIL rules/skk/Mock/addthis-com_addthis_widget.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/amazon-adsystem-com_amazon-apstag.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/amazon-adsystem-com_amazon-apstag.js.tmp" "https://ruleset.skk.moe/Mock/amazon-adsystem-com_amazon-apstag.js"; then
  mv "rules/skk/Mock/amazon-adsystem-com_amazon-apstag.js.tmp" "rules/skk/Mock/amazon-adsystem-com_amazon-apstag.js"
else
  rm -f "rules/skk/Mock/amazon-adsystem-com_amazon-apstag.js.tmp"
  echo "FAIL rules/skk/Mock/amazon-adsystem-com_amazon-apstag.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/static-chartbeat-com_chartbeat_mab.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/static-chartbeat-com_chartbeat_mab.js.tmp" "https://ruleset.skk.moe/Mock/static-chartbeat-com_chartbeat_mab.js"; then
  mv "rules/skk/Mock/static-chartbeat-com_chartbeat_mab.js.tmp" "rules/skk/Mock/static-chartbeat-com_chartbeat_mab.js"
else
  rm -f "rules/skk/Mock/static-chartbeat-com_chartbeat_mab.js.tmp"
  echo "FAIL rules/skk/Mock/static-chartbeat-com_chartbeat_mab.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/widgets-outbrain-com_outbrain.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/widgets-outbrain-com_outbrain.js.tmp" "https://ruleset.skk.moe/Mock/widgets-outbrain-com_outbrain.js"; then
  mv "rules/skk/Mock/widgets-outbrain-com_outbrain.js.tmp" "rules/skk/Mock/widgets-outbrain-com_outbrain.js"
else
  rm -f "rules/skk/Mock/widgets-outbrain-com_outbrain.js.tmp"
  echo "FAIL rules/skk/Mock/widgets-outbrain-com_outbrain.js"
  fail=1
fi
mkdir -p "$(dirname "rules/skk/Mock/securepubads-g-doubleclick-net_tag_js_gpt.js")"
if curl -fsSL --max-time 60 -A "Surge" -o "rules/skk/Mock/securepubads-g-doubleclick-net_tag_js_gpt.js.tmp" "https://ruleset.skk.moe/Mock/securepubads-g-doubleclick-net_tag_js_gpt.js"; then
  mv "rules/skk/Mock/securepubads-g-doubleclick-net_tag_js_gpt.js.tmp" "rules/skk/Mock/securepubads-g-doubleclick-net_tag_js_gpt.js"
else
  rm -f "rules/skk/Mock/securepubads-g-doubleclick-net_tag_js_gpt.js.tmp"
  echo "FAIL rules/skk/Mock/securepubads-g-doubleclick-net_tag_js_gpt.js"
  fail=1
fi

bash sync-ads.sh || fail=1
bash merge-domains.sh || fail=1

if [ "$fail" -eq 0 ]; then echo "sync ok"; else echo "some downloads failed"; fi
exit $fail
