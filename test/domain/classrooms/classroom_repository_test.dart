import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:edumonitor/infrastructure/database/repositories/classroom_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late ClassroomRepositoryImpl repo;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_cls_test_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
    repo = ClassroomRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  Future<void> seedSubject() async {
    await db
        .into(db.subjects)
        .insert(SubjectsCompanion.insert(id: 'sub1', name: 'Matematika'));
  }

  test('createClassroom inserts with default semester', () async {
    await seedSubject();
    await repo.createClassroom(
      name: 'VII A',
      subjectId: 'sub1',
      academicYear: '2026/2027',
      semester: 'Ganjil',
    );
    final list = await repo.watchAllClassrooms().first;
    expect(list.length, 1);
    expect(list.first.name, 'VII A');
    expect(list.first.semester, 'Ganjil');
  });

  test('enroll and unenroll student', () async {
    await seedSubject();
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: 'stu1', displayName: 'Andi'));
    await repo.createClassroom(
      name: 'VII A',
      subjectId: 'sub1',
      academicYear: '2026/2027',
      semester: 'Ganjil',
    );
    final classroom = (await repo.watchAllClassrooms().first).first;

    await repo.enrollStudent(classroomId: classroom.id, studentId: 'stu1');
    final enrolled = await repo.watchStudentsInClassroom(classroom.id).first;
    expect(enrolled.length, 1);
    expect(enrolled.first.displayName, 'Andi');

    await repo.unenrollStudent(classroomId: classroom.id, studentId: 'stu1');
    final afterUnenroll = await repo
        .watchStudentsInClassroom(classroom.id)
        .first;
    expect(afterUnenroll, isEmpty);
  });

  test('watchAvailableStudents excludes enrolled', () async {
    await seedSubject();
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: 'stu1', displayName: 'Andi'));
    await db
        .into(db.students)
        .insert(StudentsCompanion.insert(id: 'stu2', displayName: 'Budi'));
    await repo.createClassroom(
      name: 'VII A',
      subjectId: 'sub1',
      academicYear: '2026/2027',
      semester: 'Ganjil',
    );
    final classroom = (await repo.watchAllClassrooms().first).first;

    await repo.enrollStudent(classroomId: classroom.id, studentId: 'stu1');

    final available = await repo.watchAvailableStudents(classroom.id).first;
    expect(available.length, 1);
    expect(available.first.displayName, 'Budi');
  });

  test('deleteClassroom is soft-delete', () async {
    await seedSubject();
    await repo.createClassroom(
      name: 'VII A',
      subjectId: 'sub1',
      academicYear: '2026/2027',
      semester: 'Ganjil',
    );
    final classroom = (await repo.watchAllClassrooms().first).first;

    await repo.deleteClassroom(classroom.id);

    final visible = await repo.watchAllClassrooms().first;
    expect(visible, isEmpty);

    final all = await db.select(db.classrooms).get();
    expect(all.length, 1);
    expect(all.first.deletedAt, isNotNull);
  });
}
