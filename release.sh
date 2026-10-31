#!/bin/sh
# usage: sh release.sh 1.1.5 "release notes"
set -e
V="${1#v}"; N="$2"
[ -n "$V" ] && [ -n "$N" ] || { echo 'usage: sh release.sh 1.1.5 "release notes"'; exit 1; }
REPO="Arkael-Dev/SmoothPlay"
UPDATE_URL="https://raw.githubusercontent.com/$REPO/main/update.json"

[ -f module.prop ] || { echo "module.prop not found (run from the repo root)"; exit 1; }
[ -n "$(tail -c1 module.prop)" ] && echo >> module.prop   # make sure the file ends with a newline

# set key=value in module.prop (replace if present, append if not)
setprop() {
  if grep -q "^$1=" module.prop; then
    sed -i "s|^$1=.*|$1=$2|" module.prop
  else
    echo "$1=$2" >> module.prop
  fi
}

C=$(grep '^versionCode=' module.prop | cut -d= -f2); C=$((C+1))
setprop version "v$V"
setprop versionCode "$C"
setprop banner banner.png
setprop updateJson "$UPDATE_URL"
setprop description "Daily and Game profiles with per-app auto-switch, per-game resolution, CPU/GPU governor, manual thermal, status notification and a gaming WebUI."

cat > update.json <<JSON
{
  "version": "v$V",
  "versionCode": $C,
  "zipUrl": "https://github.com/$REPO/releases/download/v$V/SmoothPlay-v$V.zip",
  "changelog": "https://raw.githubusercontent.com/$REPO/main/CHANGELOG.md"
}
JSON

[ -f CHANGELOG.md ] || printf '# Changelog\n' > CHANGELOG.md
{ printf '# Changelog\n\n## v%s\n- %s\n' "$V" "$N"; tail -n +2 CHANGELOG.md; } > CHANGELOG.t
mv CHANGELOG.t CHANGELOG.md

for f in bin/smoothplay service.sh uninstall.sh customize.sh; do sh -n "$f"; done
echo "module.prop -> $(grep -E '^(version|versionCode|updateJson)=' module.prop | tr '\n' ' ')"

git add -A
git commit -m "Release v$V"
git push origin main
echo "Pushed. GitHub Actions is building Release v$V."
echo "Update zip: https://github.com/$REPO/releases/download/v$V/SmoothPlay-v$V.zip"
