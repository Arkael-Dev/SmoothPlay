#!/system/bin/sh
MODDIR=${0%/*}
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 3; done
sleep 10
nohup sh "$MODDIR/bin/smoothplay" daemon >/dev/null 2>&1 &
