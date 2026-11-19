# Phase 15 — Android Release APK

**Status:** SELESAI
**Tanggal:** 17 November 2026

## Ringkasan
APK release universal untuk distribusi ke tablet guru. Dibuild dengan debug
signing (default Flutter). Cukup untuk uji internal — untuk distribusi Play
Store nanti perlu keystore production terpisah.

## Output
- **Universal APK**: `build/app/outputs/flutter-apk/app-release.apk` (87 MB)
- Mengemas 3 arsitektur: arm64-v8a, armeabi-v7a, x86_64
- Signing: debug keystore (bawaan Flutter)

## Cara Build
Opsi A — Codespaces (Linux):
cd /workspaces/Edumonitor
flutter build apk --release