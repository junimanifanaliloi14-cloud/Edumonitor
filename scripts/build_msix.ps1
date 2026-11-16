# Script build MSIX — jalankan di Windows lokal
# Usage: .\scripts\build_msix.ps1

$ErrorActionPreference = "Stop"

Write-Host "=== Building EduMonitor MSIX ===" -ForegroundColor Cyan

# 1. Bersihkan build lama
Write-Host "`n[1/4] Cleaning..." -ForegroundColor Yellow
flutter clean

# 2. Ambil dependencies
Write-Host "`n[2/4] Installing dependencies..." -ForegroundColor Yellow
flutter pub get

# 3. Build Release Windows
Write-Host "`n[3/4] Building Windows Release..." -ForegroundColor Yellow
flutter build windows --release

# 4. Package ke MSIX
Write-Host "`n[4/4] Packaging MSIX..." -ForegroundColor Yellow
dart run msix:create --build-windows false

Write-Host "`n=== BUILD SELESAI ===" -ForegroundColor Green
Write-Host "Output: build\msix\edumonitor.msix" -ForegroundColor Green
Write-Host "`nUntuk install: double-click file .msix" -ForegroundColor Cyan
Write-Host "Jika muncul warning 'unsigned', klik 'More info' -> 'Run anyway'" -ForegroundColor Cyan
