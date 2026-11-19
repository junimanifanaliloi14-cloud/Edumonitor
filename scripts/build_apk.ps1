# Script build APK Release — jalankan di Windows lokal (opsional)
$ErrorActionPreference = "Stop"
Write-Host "=== Building EduMonitor APK Release ===" -ForegroundColor Cyan
flutter clean
flutter pub get
flutter build apk --release
Write-Host "`n=== BUILD SELESAI ===" -ForegroundColor Green
Write-Host "Output: build\app\outputs\flutter-apk\app-release.apk" -ForegroundColor Green