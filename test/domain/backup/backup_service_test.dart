import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/backup/backup_service_impl.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late BackupServiceImpl service;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_bk_test_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
    service = BackupServiceImpl(db);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  test('isAutoBackupEnabled defaults to true (opt-out model)', () async {
    expect(await service.isAutoBackupEnabled(), isTrue);
  });

  test('setAutoBackupEnabled persists toggle', () async {
    await service.setAutoBackupEnabled(false);
    expect(await service.isAutoBackupEnabled(), isFalse);

    await service.setAutoBackupEnabled(true);
    expect(await service.isAutoBackupEnabled(), isTrue);
  });

  test('getLastAutoBackupAt returns null initially', () async {
    expect(await service.getLastAutoBackupAt(), isNull);
  });
}
