import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/students/student_repository.dart';
import '../app_database.dart';

class StudentRepositoryImpl implements StudentRepository {
  StudentRepositoryImpl(this._db);
  final AppDatabase _db;
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
    await _db
        .into(_db.students)
        .insert(StudentsCompanion.insert(id: _uuid.v4(), displayName: name));
  }

  @override
  Future<void> updateStudent(String id, String newName) async {
    await (_db.update(_db.students)..where((t) => t.id.equals(id))).write(
      StudentsCompanion(
        displayName: Value(newName),
        updatedAt: Value(DateTime.now()),
        revision: Value(
          2,
        ), // Nanti di fase sinkronisasi ini akan bertambah otomatis
      ),
    );
  }

  @override
  Future<void> deleteStudent(String id) async {
    // Soft delete: set deletedAt dan tambah revision
    await (_db.update(_db.students)..where((t) => t.id.equals(id))).write(
      StudentsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
