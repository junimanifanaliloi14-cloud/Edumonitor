import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../domain/backup/backup_service.dart';
import '../database/app_database.dart';

class BackupServiceImpl implements BackupService {
  BackupServiceImpl(this._db);
  final AppDatabase _db;

  static const _autoBackupEnabledKey = 'auto_backup_enabled';
  static const _autoBackupLastAtKey = 'auto_backup_last_at';
  static const _autoBackupIntervalHours = 24;
  static const _maxAutoBackups = 5;

  // ==========================================
  // MANUAL EXPORT (tidak berubah dari v0.7.0)
  // ==========================================

  @override
  Future<String?> exportBackup() async {
    final dbFile = await getDatabaseFile();
    if (!await dbFile.exists()) {
      throw Exception('File database tidak ditemukan.');
    }

    final manifest = {
      'appVersion': '1.1.0',
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
  // IMPORT (tidak berubah dari v0.7.0)
  // ==========================================

  @override
  Future<void> importBackup(String zipPath) async {
    if (kIsWeb) {
      throw Exception('Restore hanya tersedia di Android/Windows.');
    }

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

    try {
      await _db.close().timeout(const Duration(seconds: 3));
    } on TimeoutException {
      // Timeout dianggap close sudah dalam proses. Lanjut.
    } catch (_) {
      // Error apapun saat close, coba lanjut.
    }

    await Future.delayed(const Duration(milliseconds: 500));
    await _deleteWithRetry(dbFile);
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

  // ==========================================
  // AUTO-BACKUP (Phase 17D — baru)
  // ==========================================

  @override
  Future<bool> isAutoBackupEnabled() async {
    final row = await (_db.select(
      _db.appSettings,
    )..where((t) => t.key.equals(_autoBackupEnabledKey))).getSingleOrNull();
    if (row == null) return true; // Default: aktif
    return row.value == 'true';
  }

  @override
  Future<void> setAutoBackupEnabled(bool enabled) async {
    await _upsertSetting(_autoBackupEnabledKey, enabled ? 'true' : 'false');
  }

  @override
  Future<DateTime?> getLastAutoBackupAt() async {
    final row = await (_db.select(
      _db.appSettings,
    )..where((t) => t.key.equals(_autoBackupLastAtKey))).getSingleOrNull();
    if (row == null) return null;
    return DateTime.tryParse(row.value);
  }

  Future<void> _upsertSetting(String key, String value) async {
    await _db
        .into(_db.appSettings)
        .insertOnConflictUpdate(
          AppSettingsCompanion.insert(key: key, value: value),
        );
  }

  Future<Directory> _getBackupDir() async {
    final support = await getApplicationSupportDirectory();
    final dir = Directory(p.join(support.path, 'edumonitor_backups'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  @override
  Future<AutoBackupResult?> runAutoBackupIfDue() async {
    if (!await isAutoBackupEnabled()) return null;

    final lastAt = await getLastAutoBackupAt();
    final now = DateTime.now();
    if (lastAt != null) {
      final since = now.difference(lastAt);
      if (since.inHours < _autoBackupIntervalHours) return null;
    }

    final dbFile = await getDatabaseFile();
    if (!await dbFile.exists()) return null;

    final dir = await _getBackupDir();
    final file = File(
      p.join(dir.path, 'autobackup_${_fileTimestamp(now)}.zip'),
    );

    final manifest = {
      'appVersion': '1.1.0',
      'schemaVersion': _db.schemaVersion,
      'timestamp': now.toIso8601String(),
      'autoBackup': true,
    };
    final manifestBytes = utf8.encode(jsonEncode(manifest));
    final dbBytes = await dbFile.readAsBytes();

    final archive = Archive();
    archive.addFile(ArchiveFile.bytes('manifest.json', manifestBytes));
    archive.addFile(ArchiveFile.bytes('edumonitor.sqlite', dbBytes));
    final zipBytes = Uint8List.fromList(ZipEncoder().encode(archive));

    await file.writeAsBytes(zipBytes, flush: true);

    final removed = await _rotateBackups(dir);
    await _upsertSetting(_autoBackupLastAtKey, now.toIso8601String());

    return AutoBackupResult(
      filePath: file.path,
      createdAt: now,
      removedOldCount: removed,
    );
  }

  Future<int> _rotateBackups(Directory dir) async {
    final files = await dir
        .list()
        .where((e) => e is File && e.path.endsWith('.zip'))
        .cast<File>()
        .toList();
    if (files.length <= _maxAutoBackups) return 0;

    final stats = <_FileStat>[];
    for (final f in files) {
      stats.add(_FileStat(file: f, modified: (await f.stat()).modified));
    }
    stats.sort((a, b) => a.modified.compareTo(b.modified));

    var removed = 0;
    final toRemove = stats.length - _maxAutoBackups;
    for (var i = 0; i < toRemove; i++) {
      try {
        await stats[i].file.delete();
        removed++;
      } catch (_) {}
    }
    return removed;
  }

  @override
  Future<List<AutoBackupInfo>> listAutoBackups() async {
    final dir = await _getBackupDir();
    final files = await dir
        .list()
        .where((e) => e is File && e.path.endsWith('.zip'))
        .cast<File>()
        .toList();

    final infos = <AutoBackupInfo>[];
    for (final f in files) {
      final stat = await f.stat();
      infos.add(
        AutoBackupInfo(
          filePath: f.path,
          createdAt: stat.modified,
          sizeBytes: stat.size,
        ),
      );
    }
    infos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return infos;
  }

  String _fileTimestamp(DateTime dt) =>
      '${dt.year}'
      '${dt.month.toString().padLeft(2, '0')}'
      '${dt.day.toString().padLeft(2, '0')}_'
      '${dt.hour.toString().padLeft(2, '0')}'
      '${dt.minute.toString().padLeft(2, '0')}'
      '${dt.second.toString().padLeft(2, '0')}';
}

class _FileStat {
  _FileStat({required this.file, required this.modified});
  final File file;
  final DateTime modified;
}
