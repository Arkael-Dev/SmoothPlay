# SmoothPlay

A Magisk / KernelSU / APatch module with a WebUI that switches between **Daily** and **Game** profiles automatically, per app.

Author: [@arqzey](https://github.com/Arkael-Dev)

## Features
- **Daily and Game profiles**, selected manually or automatically.
- **Per-app auto-switch**: a lightweight daemon checks the foreground app every few seconds and switches to Game when the app is on your game list.
- **Game profile**: CPU governor `performance` (if available), swappiness 40, vfs_cache_pressure 50, TCP `bbr` (if available), 0.5x animations, locked refresh rate, optional Do Not Disturb, and `cmd game mode performance` on Android 12+.
- **Daily profile**: restores the original kernel values, 0.7x animations, and your chosen maximum refresh rate.
- **Refresh rate** configured separately for Daily and Game (via `min/peak_refresh_rate`).
- **Game list** picked from your installed apps, with search.
- **WebUI in English and Indonesian**: switch language from the header (saved automatically).
- **Tools**: clean RAM (`am kill-all`), clear caches (`pm trim-caches`), optimize apps (`cmd package compile -m speed-profile`), and a log viewer.
- **Restore defaults**: original values are saved before the first change.

## Install
1. Download `SmoothPlay-vX.Y.Z.zip` from [Releases](https://github.com/Arkael-Dev/SmoothPlay/releases).
2. Flash it in Magisk, KernelSU or APatch, then reboot.
3. Open the WebUI from your manager. On Magisk, use the KsuWebUI app.

## Notes
- Some devices (e.g. Samsung) control refresh rate through other settings keys, so the refresh rate option may have no effect.
- Tap **Restore defaults** before uninstalling so animation and refresh rate settings return to normal.
- CLI: `su -c sh /data/adb/modules/smoothplay/bin/smoothplay status`

## Build and release
Pushing a change to `module.prop`, `bin/`, `webroot/` or the install scripts triggers GitHub Actions, which builds the zip and publishes a Release for new versions.

To ship an update from Termux:
```
sh release.sh 1.0.1 "What changed"
```

Build a zip locally:
```
sh build.sh
```

## License
MIT
