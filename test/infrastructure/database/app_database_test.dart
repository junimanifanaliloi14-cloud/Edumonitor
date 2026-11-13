import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

void main() {
  late Directory tempDir;
  late AppDatabase db;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_db_test_');
    final file = File(p.join(tempDir.path, 'test.sqlite'));
    final executor = NativeDatabase(file);
    db = AppDatabase(executor);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('sqlite3 version is available', () {
    expect(sqlite3.version.libVersion, isNotEmpty);
  });

  test('insert and query a student', () async {
    await db.into(db.students).insert(
          StudentsCompanion.insert(
            id: 'stu-1',
            displayName: 'Aisyah',
          ),
        );

    final rows = await db.select(db.students).get();
    expect(rows.length, 1);
    expect(rows.first.id, 'stu-1');
    expect(rows.first.displayName, 'Aisyah');
    expect(rows.first.revision, 1);
    expect(rows.first.deletedAt, isNull);
  });

  test('insert and query a subject', () async {
    await db.into(db.subjects).insert(
          SubjectsCompanion.insert(
            id: 'sub-1',
            name: 'Matematika',
          ),
        );

    final rows = await db.select(db.subjects).get();
    expect(rows.length, 1);
    expect(rows.first.name, 'Matematika');
  });

  test('schema version is 1', () {
    expect(db.schemaVersion, 1);
  });
}
