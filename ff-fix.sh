#!/bin/sh

die () {
  printf "\nFATAL: %s\n\n" "$@" >&2
  exit 1
}

pidof firefox > /dev/null && 
die "You must exit Firefox before running this script."

cd ~/.mozilla/firefox/*.default 2> /dev/null || 
die "~/.mozilla/firefox/*.default directory not found.
Launch Firefox at least once before running this script."

mkdir -p chrome

[ -f chrome/userChrome.css ] || echo \
'@namespace url(http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);' \
> chrome/userChrome.css

echo '* { font-size:12pt !important; }' >> chrome/userChrome.css

cat << EOF >> prefs.js
user_pref("font.default.x-western", "sans-serif");
user_pref("font.minimum-size.x-western", 12);
user_pref("font.size.fixed.x-western", 16);
user_pref("font.size.variable.x-western", 18);
EOF


mkdir -p extensions

theme_site='https://addons.mozilla.org/firefox/downloads/latest'
theme_url="$theme_site/adwaita/platform:2/addon-320596-latest.xpi"

/usr/bin/firefox "$theme_url"

