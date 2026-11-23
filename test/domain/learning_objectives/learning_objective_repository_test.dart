import 'dart:io';

import 'package:drift/native.dart';
import 'package:edumonitor/infrastructure/database/app_database.dart';
import 'package:edumonitor/infrastructure/database/repositories/learning_objective_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory tempDir;
  late AppDatabase db;
  late LearningObjectiveRepositoryImpl repo;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('edumonitor_lo_test_');
    db = AppDatabase(NativeDatabase(File(p.join(tempDir.path, 'test.sqlite'))));
    repo = LearningObjectiveRepositoryImpl(db);

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
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  test('create LO with code, description, sequence', () async {
    await repo.createLearningObjective(
      classroomId: 'cls1',
      code: '7.1',
      description: 'Operasi bilangan bulat',
      sequence: 1,
    );
    final list = await repo.watchLearningObjectives('cls1').first;
    expect(list.length, 1);
    expect(list.first.code, '7.1');
    expect(list.first.description, 'Operasi bilangan bulat');
  });

  test('watch ordered by sequence asc', () async {
    await repo.createLearningObjective(
      classroomId: 'cls1',
      code: '7.2',
      description: 'Pecahan',
      sequence: 2,
    );
    await repo.createLearningObjective(
      classroomId: 'cls1',
      code: '7.1',
      description: 'Bilangan bulat',
      sequence: 1,
    );
    final list = await repo.watchLearningObjectives('cls1').first;
    expect(list.length, 2);
    expect(list[0].code, '7.1');
    expect(list[1].code, '7.2');
  });

  test('update LO changes fields', () async {
    await repo.createLearningObjective(
      classroomId: 'cls1',
      code: '7.1',
      description: 'Old desc',
      sequence: 1,
    );
    final created = (await repo.watchLearningObjectives('cls1').first).first;

    await repo.updateLearningObjective(
      id: created.id,
      code: '7.1b',
      description: 'New desc',
      sequence: 5,
    );
    final updated = (await repo.watchLearningObjectives('cls1').first).first;
    expect(updated.code, '7.1b');
    expect(updated.description, 'New desc');
    expect(updated.sequence, 5);
  });

  test('delete LO is soft-delete', () async {
    await repo.createLearningObjective(
      classroomId: 'cls1',
      code: '7.1',
      description: 'Test',
      sequence: 1,
    );
    final created = (await repo.watchLearningObjectives('cls1').first).first;

    await repo.deleteLearningObjective(created.id);

    final visible = await repo.watchLearningObjectives('cls1').first;
    expect(visible, isEmpty);

    final all = await db.select(db.learningObjectives).get();
    expect(all.length, 1);
    expect(all.first.deletedAt, isNotNull);
  });
}
