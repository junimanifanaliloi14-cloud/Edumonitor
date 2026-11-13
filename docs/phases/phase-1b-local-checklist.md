# Phase 1B — Verifikasi Lokal (Windows + Tablet Android)

Tujuan: melengkapi verifikasi yang tidak bisa dijalankan di Codespaces.
Eksekusi di mesin lokal (PC Windows + tablet Android fisik).

## Prasyarat
- Windows 10/11 dengan Flutter 3.47.9 stable
- Android Studio + SDK 36.0.0 + build-tools 36.0.0
- JDK 17
- Tablet Android dengan USB debugging
- Git + repo ter-clone

## Verifikasi 1 — Environment Windows

flutter --version
flutter doctor -v
flutter devices

Harus terlihat:
- Flutter 3.47.9 stable
- Android toolchain hijau
- Windows desktop toolchain hijau (Visual Studio 2022 dengan C++ desktop workload)
- Tablet Android terdeteksi

## Verifikasi 2 — Build Windows

flutter clean
flutter pub get
flutter build windows

Hasil: build/windows/x64/runner/Debug/edumonitor.exe berhasil.

## Verifikasi 3 — Jalankan di Windows

flutter run -d windows

Yang dibuktikan:
- Placeholder "EduMonitor / Phase 1A — Foundation" tampil
- SQLite dapat dibuka
- Tidak crash saat start

## Verifikasi 4 — Build APK + install tablet

flutter build apk --debug
adb devices
flutter install -d <device_id>

Yang dibuktikan:
- APK terpasang dan terbuka di tablet
- Placeholder tampil
- SQLite tersedia
- Tidak crash

## Verifikasi 5 — Drift storage di dua platform

Verifikasi bahwa file database terbentuk di storage aplikasi.
Android: path getApplicationSupportDirectory (data/data/com.edumonitor.edumonitor/...)
Windows: path getApplicationSupportDirectory (%APPDATA%/...)

Langkah: tambahkan log sementara di main.dart untuk mencetak path database, jalankan di kedua platform, catat path, hapus log.

## Hasil yang harus dilaporkan

Untuk setiap verifikasi:
1. Perintah yang dijalankan
2. Output akhir (baris terakhir / status)
3. Error lengkap jika ada

## Gate kelulusan Phase 1B

| Verifikasi | Status |
|---|---|
| Build Windows sukses | (diisi) |
| Jalankan di Windows sukses | (diisi) |
| Build APK + install tablet sukses | (diisi) |
| Verifikasi Drift storage di dua platform | (diisi) |

## Setelah Phase 1B lulus

Phase 1 resmi selesai. Lanjut Phase 2 — Database Core penuh:
- curriculum (subject, chapter, topic, competency)
- documents & knowledge
- engines & rules
- templates & sharing
- questions & assessments
- student progress
- sync & security