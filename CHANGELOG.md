# Changelog

## v1.2.1
- Config file is now fully documented with every key at its default; fixed a stale dead-code assignment in 'set'; every README section matches the new refresh rate and animation behaviour; fixed the Daily refresh-rate description in the WebUI; module.prop lookup falls back to the script directory.

## v1.2.0
- Daily profile no longer pins the minimum refresh rate (peak only) so idle stays efficient; animation speed is now a setting (Daily/Game) instead of hardcoded 0.7; the daemon skips the foreground dump while the screen is off; the thermal guard also runs on status calls so it still trips with the daemon dead; removing a running game clears its downscale; real 32G cache trim; profile is reapplied on daemon start.

## v1.1.9
- Remove ZRAM feature

## v1.1.8
- Fix status notification not appearing after tapping options (posted via daemon, logs failures)

## v1.1.7
- Status notification uses only the monochrome gamepad icon

## v1.1.6
- Fix status notification not appearing after tapping options (posted via daemon, logs failures)

## v1.1.5
- Fix KSU Next auto-update (updateJson), ZRAM rejected-size report

## v1.1.4
- Per-game resolution dropdown, manual thermal Running/Stopped (no auto apply)

## v1.1.3
- Downscale now applies only to detected games; Daily always native resolution

## v1.1.1
- Gaming-style animated WebUI, gamepad logo, module banner, LSPosed-style status notification, stable release

## v1.1.0
- Manual CPU/GPU governor, downscale 100-30%, thermal toggle, status notification, ZRAM/VM options

## v1.0.2
- WebUI: add English and Indonesian language switch

## v1.0.0
- Initial release: Daily/Game profiles, per-app auto-switch, refresh rate control, Do Not Disturb, WebUI.
