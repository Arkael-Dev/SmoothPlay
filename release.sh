#!/bin/sh
# usage: sh release.sh 1.0.1 "release notes"
set -e
V="$1"; N="$2"
[ -n "$V" ] && [ -n "$N" ] || { echo 'usage: sh release.sh 1.0.1 "release notes"'; exit 1; }
# module card banner + description (KernelSU-Next / APatch show the banner image)
grep -q '^banner=' module.prop || echo 'banner=banner.png' >> module.prop
sed -i 's|^description=.*|description=Daily and Game profiles with per-app auto-switch, CPU/GPU governor, downscale, thermal toggle, status notification and a gaming WebUI.|' module.prop
C=$(grep '^versionCode=' module.prop | cut -d= -f2); C=$((C+1))
sed -i "s/^version=.*/version=v$V/; s/^versionCode=.*/versionCode=$C/" module.prop
cat > update.json <<JSON
{
  "version": "v$V",
  "versionCode": $C,
  "zipUrl": "https://github.com/Arkael-Dev/SmoothPlay/releases/download/v$V/SmoothPlay-v$V.zip",
  "changelog": "https://raw.githubusercontent.com/Arkael-Dev/SmoothPlay/main/CHANGELOG.md"
}
JSON
{ printf '# Changelog\n\n## v%s\n- %s\n' "$V" "$N"; tail -n +2 CHANGELOG.md; } > CHANGELOG.t
mv CHANGELOG.t CHANGELOG.md
for f in bin/smoothplay service.sh uninstall.sh customize.sh; do sh -n "$f"; done
git add -A
git commit -m "Release v$V"
git push origin main
echo "Pushed. GitHub Actions is building Release v$V."
