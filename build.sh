#!/bin/sh
V=$(grep '^version=' module.prop | cut -d= -f2)
rm -f "SmoothPlay-$V.zip"
zip -r "SmoothPlay-$V.zip" module.prop customize.sh service.sh uninstall.sh bin webroot
echo "Dibuat: SmoothPlay-$V.zip"
