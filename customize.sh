#!/system/bin/sh
SKIPUNZIP=0
DATA=/data/adb/smoothplay

if [ "$API" -lt 26 ]; then
  abort "! Requires Android 8.0 (API 26) or newer"
fi

ui_print "- SmoothPlay by @arqzey"
mkdir -p "$DATA"
touch "$DATA/games.list"

set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm "$MODPATH/bin/smoothplay" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/uninstall.sh" 0 0 0755

ui_print "- Done. Open the WebUI from your root manager to configure."
