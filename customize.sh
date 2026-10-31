#!/system/bin/sh
SKIPUNZIP=0
DATA=/data/adb/smoothplay

if [ "$API" -lt 26 ]; then
  abort "! Butuh Android 8.0 (API 26) atau lebih baru"
fi

ui_print "- SmoothPlay oleh @arqzey"
mkdir -p "$DATA"
touch "$DATA/games.list"

set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm "$MODPATH/bin/smoothplay" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/uninstall.sh" 0 0 0755

ui_print "- Selesai. Buka WebUI dari manager untuk mengatur."
