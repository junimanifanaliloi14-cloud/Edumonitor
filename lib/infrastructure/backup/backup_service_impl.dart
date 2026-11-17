import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/backup/backup_service.dart';
import '../database/app_database.dart';

class BackupServiceImpl implements BackupService {
  BackupServiceImpl(this._db);
  final AppDatabase _db;

  // ==========================================
  // EXPORT BACKUP (tidak berubah dari v0.6.1)
  // ==========================================

  @override
  Future<String?> exportBackup() async {
    final dbFile = await getDatabaseFile();
    if (!await dbFile.exists()) {
      throw Exception('File database tidak ditemukan.');
    }

    final manifest = {
      'appVersion': '0.7.0',
      'schemaVersion': _db.schemaVersion,
      'timestamp': DateTime.now().toIso8601String(),
      'files': ['edumonitor.sqlite'],
    };

    final dbBytes = await dbFile.readAsBytes();
    final manifestBytes = utf8.encode(jsonEncode(manifest));

    final archive = Archive();
    archive.addFile(ArchiveFile.bytes('manifest.json', manifestBytes));
    archive.addFile(ArchiveFile.bytes('edumonitor.sqlite', dbBytes));

    final zipBytes = Uint8List.fromList(ZipEncoder().encode(archive));

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final saveUri = await FilePicker.saveFile(
      dialogTitle: 'Simpan Backup EduMonitor',
      fileName: 'edumonitor_backup_$timestamp.zip',
      bytes: zipBytes,
    );

    if (saveUri == null) return null;
    return saveUri.path;
  }

  // ==========================================
  // IMPORT BACKUP — robust untuk Windows file locking
  // ==========================================

  @override
  Future<void> importBackup(String zipPath) async {
    if (kIsWeb) {
      throw Exception('Restore hanya tersedia di Android/Windows.');
    }

    // 1. Baca & validasi zip
    final zipBytes = await File(zipPath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(zipBytes);

    final manifestEntry = archive.findFile('manifest.json');
    if (manifestEntry == null) {
      throw Exception(
        'Format backup tidak valid: manifest.json tidak ditemukan.',
      );
    }

    final manifestContent = manifestEntry.content as List<int>;
    final manifest =
        jsonDecode(utf8.decode(manifestContent)) as Map<String, dynamic>;
    final backupSchemaVersion = manifest['schemaVersion'] as int?;

    if (backupSchemaVersion != _db.schemaVersion) {
      throw Exception(
        'Versi backup ($backupSchemaVersion) tidak cocok dengan aplikasi '
        '(${_db.schemaVersion}). Backup mungkin dari versi lama.',
      );
    }

    final dbEntry = archive.findFile('edumonitor.sqlite');
    if (dbEntry == null) {
      throw Exception('Database tidak ditemukan dalam backup.');
    }

    final dbContent = dbEntry.content as List<int>;
    final dbFile = await getDatabaseFile();

    // 2. Close database dengan timeout — jangan biarkan hang selamanya
    try {
      await _db.close().timeout(const Duration(seconds: 3));
    } on TimeoutException {
      // Timeout dianggap "close sudah dalam proses". Kita lanjut.
    } catch (_) {
      // Error apapun saat close, kita coba lanjut juga.
    }

    // 3. Beri waktu OS Windows release file handle
    await Future.delayed(const Duration(milliseconds: 500));

    // 4. Hapus file lama dengan retry
    await _deleteWithRetry(dbFile);

    // 5. Tulis file baru dengan retry
    await _writeWithRetry(dbFile, dbContent);
  }

  Future<void> _deleteWithRetry(File file, {int attempts = 5}) async {
    for (var i = 0; i < attempts; i++) {
      try {
        if (await file.exists()) {
          await file.delete();
        }
        return;
      } catch (e) {
        if (i == attempts - 1) {
          throw Exception(
            'Gagal menghapus database lama setelah $attempts percobaan: $e',
          );
        }
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }
  }

  Future<void> _writeWithRetry(
    File file,
    List<int> bytes, {
    int attempts = 5,
  }) async {
    for (var i = 0; i < attempts; i++) {
      try {
        await file
            .writeAsBytes(bytes, flush: true)
            .timeout(const Duration(seconds: 5));
        return;
      } catch (e) {
        if (i == attempts - 1) {
          throw Exception(
            'Gagal menulis database baru setelah $attempts percobaan: $e',
          );
        }
        await Future.delayed(const Duration(milliseconds: 300));
      }
    }
  }
}
