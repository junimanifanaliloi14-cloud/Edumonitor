import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:edumonitor/infrastructure/database/repositories/journal_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late JournalRepositoryImpl repo;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_journal_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
    repo = JournalRepositoryImpl(db);

    // Seed dasar: subject, classroom, 2 students
    await db
        .into(db.subjects)
        .insert(SubjectsCompanion.insert(id: 'sub1', name: 'Matematika'));
    await db
        .into(db.classrooms)
        .insert(
          ClassroomsCompanion.insert(
            id: 'cls1',
            name: 'VII A',
            subjectId: 'sub1',
            academicYear: '2026/2027',
          ),
        );
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: 'stu1', displayName: 'Andi'));
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: 'stu2', displayName: 'Budi'));
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  test('createJournalEntry with attendance', () async {
    await repo.createJournalEntry(
      classroomId: 'cls1',
      date: DateTime(2026, 11, 26),
      title: 'Pertemuan 1',
      activity: 'Membahas operasi bilangan bulat',
      attendances: {'stu1': 'hadir', 'stu2': 'izin'},
    );

    final entries = await repo.watchJournalEntries('cls1').first;
    expect(entries.length, 1);
    expect(entries.first.title, 'Pertemuan 1');
    expect(entries.first.activity, contains('bilangan bulat'));

    final attendances = await repo.watchAttendances(entries.first.id).first;
    expect(attendances.length, 2);
    final statusByStudent = {
      for (final a in attendances) a.studentId: a.status,
    };
    expect(statusByStudent['stu1'], 'hadir');
    expect(statusByStudent['stu2'], 'izin');
  });

  test('updateJournalEntry modifies activity and attendance', () async {
    await repo.createJournalEntry(
      classroomId: 'cls1',
      date: DateTime(2026, 11, 26),
      activity: 'Old activity',
      attendances: {'stu1': 'hadir', 'stu2': 'hadir'},
    );

    final entry = (await repo.watchJournalEntries('cls1').first).first;

    await repo.updateJournalEntry(
      id: entry.id,
      activity: 'New activity',
      attendances: {'stu1': 'alpha', 'stu2': 'sakit'},
    );

    final updated = await repo.getJournalEntry(entry.id);
    expect(updated!.activity, 'New activity');

    final attendances = await repo.watchAttendances(entry.id).first;
    final statusByStudent = {
      for (final a in attendances) a.studentId: a.status,
    };
    expect(statusByStudent['stu1'], 'alpha');
    expect(statusByStudent['stu2'], 'sakit');
  });

  test('deleteJournalEntry soft-deletes entry + attendances', () async {
    await repo.createJournalEntry(
      classroomId: 'cls1',
      date: DateTime(2026, 11, 26),
      activity: 'Test',
      attendances: {'stu1': 'hadir'},
    );
    final entry = (await repo.watchJournalEntries('cls1').first).first;

    await repo.deleteJournalEntry(entry.id);

    final visible = await repo.watchJournalEntries('cls1').first;
    expect(visible, isEmpty);

    final all = await db.select(db.journalEntries).get();
    expect(all.length, 1);
    expect(all.first.deletedAt, isNotNull);

    final allAtt = await db.select(db.attendances).get();
    expect(allAtt.every((a) => a.deletedAt != null), isTrue);
  });

  test('journal ordered by date desc (most recent first)', () async {
    await repo.createJournalEntry(
      classroomId: 'cls1',
      date: DateTime(2026, 11, 20),
      activity: 'Older',
    );
    await repo.createJournalEntry(
      classroomId: 'cls1',
      date: DateTime(2026, 11, 27),
      activity: 'Newer',
    );

    final entries = await repo.watchJournalEntries('cls1').first;
    expect(entries.length, 2);
    expect(entries.first.activity, 'Newer');
    expect(entries.last.activity, 'Older');
  });
}
