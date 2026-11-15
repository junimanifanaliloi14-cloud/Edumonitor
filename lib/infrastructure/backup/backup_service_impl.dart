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

  @override
  Future<String?> exportBackup() async {
    final dbFile = await getDatabaseFile();
    if (!await dbFile.exists()) {
      throw Exception('File database tidak ditemukan.');
    }

    // 1. Buat manifest
    final manifest = {
      'appVersion': '0.1.0',
      'schemaVersion': _db.schemaVersion,
      'timestamp': DateTime.now().toIso8601String(),
      'files': ['edumonitor.sqlite'],
    };

    // 2. Baca file DB
    final dbBytes = await dbFile.readAsBytes();
    final manifestBytes = utf8.encode(jsonEncode(manifest));

    // 3. Buat arsip ZIP
    final archive = Archive();
    archive.addFile(ArchiveFile.bytes('manifest.json', manifestBytes));
    archive.addFile(ArchiveFile.bytes('edumonitor.sqlite', dbBytes));

    // Uint8List disediakan oleh flutter/foundation.dart, tidak perlu dart:typed_data
    final zipBytes = Uint8List.fromList(ZipEncoder().encode(archive));

    // 4. Minta user memilih lokasi simpan
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final saveUri = await FilePicker.saveFile(
      dialogTitle: 'Simpan Backup EduMonitor',
      fileName: 'edumonitor_backup_$timestamp.zip',
      bytes: zipBytes,
    );

    if (saveUri == null) {
      return null; // User membatalkan dialog
    }

    // 5. Kembalikan path yang dipilih
    return saveUri.path;
  }

  @override
  Future<void> importBackup(String zipPath) async {
    if (kIsWeb) {
      throw Exception('Restore hanya tersedia di Android/Windows.');
    }

    final zipBytes = await File(zipPath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(zipBytes);

    // 1. Validasi manifest
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
        'Versi backup ($backupSchemaVersion) tidak cocok dengan aplikasi (${_db.schemaVersion}).',
      );
    }

    // 2. Ambil file DB
    final dbEntry = archive.findFile('edumonitor.sqlite');
    if (dbEntry == null) {
      throw Exception('Database tidak ditemukan dalam backup.');
    }

    final dbContent = dbEntry.content as List<int>;

    // 3. Tutup database, ganti file
    final dbFile = await getDatabaseFile();
    await _db.close();
    await dbFile.writeAsBytes(dbContent, flush: true);
  }
}
