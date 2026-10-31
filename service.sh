#!/system/bin/sh
MODDIR=${0%/*}
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 3; done
sleep 10
rm -f /data/adb/smoothplay/daemon.pid
nohup sh "$MODDIR/bin/smoothplay" daemon >/dev/null 2>&1 &
