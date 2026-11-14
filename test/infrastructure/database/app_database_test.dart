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

  test('schema version is 2', () {
    expect(db.schemaVersion, 2);
  });

  test('insert and query curriculum hierarchy', () async {
    // 1. Insert Subject
    await db.into(db.subjects).insert(
          SubjectsCompanion.insert(id: 's1', name: 'Matematika'),
        );

    // 2. Insert Chapter (relasi ke Subject)
    await db.into(db.chapters).insert(
          ChaptersCompanion.insert(id: 'c1', subjectId: 's1', name: 'Aljabar'),
        );

    // 3. Insert Topic (relasi ke Chapter)
    await db.into(db.topics).insert(
          TopicsCompanion.insert(
              id: 't1', chapterId: 'c1', name: 'Persamaan Linear'),
        );

    // 4. Insert Competency (relasi ke Topic)
    await db.into(db.competencies).insert(
          CompetenciesCompanion.insert(
            id: 'comp1',
            topicId: 't1',
            description:
                'Siswa dapat menyelesaikan persamaan linear satu variabel',
          ),
        );

    // Verifikasi data tersimpan
    final competencies = await db.select(db.competencies).get();
    expect(competencies.length, 1);
    expect(competencies.first.description, contains('linear'));

    final chapters = await db.select(db.chapters).get();
    expect(chapters.length, 1);
    expect(chapters.first.name, 'Aljabar');
  });
}