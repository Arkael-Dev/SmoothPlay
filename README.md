# SmoothPlay

Modul Magisk / KernelSU / APatch dengan WebUI untuk profil **Daily** dan **Game** yang berpindah otomatis per aplikasi.

Author: [@arqzey](https://github.com/Arkael-Dev)

## Fitur
- **Profil Daily & Game**, dipilih manual atau otomatis.
- **Auto-switch per aplikasi**: daemon ringan memeriksa aplikasi di depan tiap beberapa detik dan beralih ke Game bila ada di daftar.
- **Profil Game**: governor CPU `performance` (jika tersedia), swappiness 40, vfs_cache_pressure 50, TCP `bbr` (jika tersedia), animasi 0.5x, refresh rate terkunci, DND opsional, dan `cmd game mode performance` pada Android 12+.
- **Profil Daily**: mengembalikan nilai kernel bawaan, animasi 0.7x, refresh rate maksimum sesuai pilihan.
- **Refresh rate** terpisah untuk Daily dan Game (via `min/peak_refresh_rate`).
- **Daftar game** dipilih dari aplikasi terpasang.
- **Alat**: bersihkan RAM (`am kill-all`), bersihkan cache (`pm trim-caches`), optimasi aplikasi (`cmd package compile -m speed-profile`).
- **Pulihkan bawaan**: semua nilai asli disimpan sebelum perubahan pertama.

## Pasang
1. Unduh `SmoothPlay-vX.Y.Z.zip` dari Releases.
2. Flash lewat Magisk, KernelSU, atau APatch, lalu reboot.
3. Buka WebUI dari manager. Di Magisk, gunakan aplikasi KsuWebUI.

## Catatan
- Beberapa perangkat (mis. Samsung) mengatur refresh rate lewat kunci lain; opsi refresh rate bisa tidak berpengaruh.
- Tekan **Pulihkan bawaan** sebelum menghapus modul agar pengaturan animasi dan refresh rate kembali.
- Perintah CLI: `su -c sh /data/adb/modules/smoothplay/bin/smoothplay status`

## Build
```
sh build.sh
```
