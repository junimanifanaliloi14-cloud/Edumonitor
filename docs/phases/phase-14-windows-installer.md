# Phase 14 — Windows Installer (MSIX)

**Status:** KONFIGURASI SIAP (build dijalankan di Windows lokal)
**Tanggal:** 16 November 2026

## Ringkasan
Konfigurasi MSIX telah ditambahkan ke pubspec.yaml. Build MSIX hanya bisa
dijalankan di Windows host (bukan Codespaces/Linux), karena msix package
memerlukan Windows SDK untuk packaging.

## Yang Sudah Ada
- `pubspec.yaml` bagian `msix_config:` — display name, publisher, capabilities
- `scripts/build_msix.ps1` — script build otomatis
- Icon aplikasi dari `assets/icon/app_icon.png` (dipakai sebagai logo MSIX)
- Capabilities: `internetClient` (Sync) + `privateNetworkClientServer` (LAN)

## Cara Build (Windows lokal)

```powershell
cd C:\Projects\Edumonitor
git pull origin main
flutter pub get
.\scripts\build_msix.ps1