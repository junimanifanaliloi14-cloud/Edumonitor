import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/students/student_repository.dart';
import '../app_database.dart';

class StudentRepositoryImpl implements StudentRepository {
  StudentRepositoryImpl(this._db, {required this.localDeviceId});
  final AppDatabase _db;
  final String localDeviceId;
  final _uuid = const Uuid();

  @override
  Stream<List<Student>> watchAllStudents() {
    return (_db.select(_db.students)
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.displayName)]))
        .watch();
  }

  @override
  Future<void> addStudent(String name) async {
    final id = _uuid.v4();
    final now = DateTime.now();

    await _db.transaction(() async {
      await _db
          .into(_db.students)
          .insert(
            StudentsCompanion.insert(
              id: id,
              displayName: name,
              createdByDeviceId: Value(localDeviceId),
              createdAt: Value(now),
              updatedAt: Value(now),
            ),
          );

      await _db
          .into(_db.syncEvents)
          .insert(
            SyncEventsCompanion.insert(
              id: _uuid.v4(),
              entityType: 'student',
              entityId: id,
              operation: 'create',
              baseRevision: 0,
              newRevision: 1,
              payloadJson: jsonEncode({
                'id': id,
                'displayName': name,
                'notes': null,
                'createdByDeviceId': localDeviceId,
                'updatedAt': now.toIso8601String(),
              }),
              deviceId: localDeviceId,
              idempotencyKey: _uuid.v4(),
            ),
          );
    });
  }

  @override
  Future<void> updateStudent(String id, String newName) async {
    final now = DateTime.now();

    await _db.transaction(() async {
      final current = await (_db.select(
        _db.students,
      )..where((t) => t.id.equals(id))).getSingle();
      final newRevision = current.revision + 1;

      await (_db.update(_db.students)..where((t) => t.id.equals(id))).write(
        StudentsCompanion(
          displayName: Value(newName),
          updatedAt: Value(now),
          revision: Value(newRevision),
        ),
      );

      await _db
          .into(_db.syncEvents)
          .insert(
            SyncEventsCompanion.insert(
              id: _uuid.v4(),
              entityType: 'student',
              entityId: id,
              operation: 'update',
              baseRevision: current.revision,
              newRevision: newRevision,
              payloadJson: jsonEncode({
                'id': id,
                'displayName': newName,
                'notes': current.notes,
                'createdByDeviceId': current.createdByDeviceId,
                'updatedAt': now.toIso8601String(),
              }),
              deviceId: localDeviceId,
              idempotencyKey: _uuid.v4(),
            ),
          );
    });
  }

  @override
  Future<void> deleteStudent(String id) async {
    final now = DateTime.now();

    await _db.transaction(() async {
      final current = await (_db.select(
        _db.students,
      )..where((t) => t.id.equals(id))).getSingle();
      final newRevision = current.revision + 1;

      await (_db.update(_db.students)..where((t) => t.id.equals(id))).write(
        StudentsCompanion(
          deletedAt: Value(now),
          updatedAt: Value(now),
          revision: Value(newRevision),
        ),
      );

      await _db
          .into(_db.syncEvents)
          .insert(
            SyncEventsCompanion.insert(
              id: _uuid.v4(),
              entityType: 'student',
              entityId: id,
              operation: 'delete',
              baseRevision: current.revision,
              newRevision: newRevision,
              payloadJson: jsonEncode({
                'id': id,
                'deletedAt': now.toIso8601String(),
                'updatedAt': now.toIso8601String(),
              }),
              deviceId: localDeviceId,
              idempotencyKey: _uuid.v4(),
            ),
          );
    });
  }
}
