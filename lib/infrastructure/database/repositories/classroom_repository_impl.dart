import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/classrooms/classroom_repository.dart';
import '../app_database.dart';

class ClassroomRepositoryImpl implements ClassroomRepository {
  ClassroomRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  // ==========================================
  // CLASSROOM CRUD
  // ==========================================

  @override
  Stream<List<Classroom>> watchAllClassrooms() {
    return (_db.select(_db.classrooms)
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([
            (t) => OrderingTerm(
              expression: t.academicYear,
              mode: OrderingMode.desc,
            ),
            (t) => OrderingTerm(expression: t.name),
          ]))
        .watch();
  }

  @override
  Future<void> createClassroom({
    required String name,
    required String subjectId,
    required String academicYear,
    required String semester,
    String? teacherNote,
  }) async {
    await _db
        .into(_db.classrooms)
        .insert(
          ClassroomsCompanion.insert(
            id: _uuid.v4(),
            name: name,
            subjectId: subjectId,
            academicYear: academicYear,
            semester: Value(semester),
            teacherNote: Value(teacherNote),
          ),
        );
  }

  @override
  Future<void> updateClassroom({
    required String id,
    String? name,
    String? academicYear,
    String? semester,
    String? teacherNote,
  }) async {
    await (_db.update(_db.classrooms)..where((t) => t.id.equals(id))).write(
      ClassroomsCompanion(
        name: name != null ? Value(name) : const Value.absent(),
        academicYear: academicYear != null
            ? Value(academicYear)
            : const Value.absent(),
        semester: semester != null ? Value(semester) : const Value.absent(),
        teacherNote: teacherNote != null
            ? Value(teacherNote)
            : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteClassroom(String id) async {
    await (_db.update(_db.classrooms)..where((t) => t.id.equals(id))).write(
      ClassroomsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  // ==========================================
  // STUDENTS IN CLASSROOM
  // ==========================================

  @override
  Stream<List<Student>> watchStudentsInClassroom(String classroomId) {
    final query =
        _db.select(_db.students).join([
            innerJoin(
              _db.classroomStudents,
              _db.classroomStudents.studentId.equalsExp(_db.students.id),
            ),
          ])
          ..where(_db.classroomStudents.classroomId.equals(classroomId))
          ..where(_db.classroomStudents.deletedAt.isNull())
          ..where(_db.students.deletedAt.isNull())
          ..orderBy([OrderingTerm.asc(_db.students.displayName)]);

    return query.watch().map((rows) {
      return rows.map((row) => row.readTable(_db.students)).toList();
    });
  }

  @override
  Stream<List<Student>> watchAvailableStudents(String classroomId) {
    return (_db.select(_db.students)
          ..where((t) => t.deletedAt.isNull())
          ..where(
            (t) => t.id.isNotInQuery(
              _db.selectOnly(_db.classroomStudents)
                ..addColumns([_db.classroomStudents.studentId])
                ..where(_db.classroomStudents.classroomId.equals(classroomId))
                ..where(_db.classroomStudents.deletedAt.isNull()),
            ),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.displayName)]))
        .watch();
  }

  @override
  Future<void> enrollStudent({
    required String classroomId,
    required String studentId,
  }) async {
    final existing =
        await (_db.select(_db.classroomStudents)..where(
              (t) =>
                  t.classroomId.equals(classroomId) &
                  t.studentId.equals(studentId),
            ))
            .getSingleOrNull();

    if (existing != null) {
      // Re-enroll: hapus soft delete jika sebelumnya dihapus
      if (existing.deletedAt != null) {
        await (_db.update(
          _db.classroomStudents,
        )..where((t) => t.id.equals(existing.id))).write(
          ClassroomStudentsCompanion(
            deletedAt: const Value(null),
            revision: Value(existing.revision + 1),
          ),
        );
      }
      return; // Sudah terdaftar, tidak perlu insert baru
    }

    await _db
        .into(_db.classroomStudents)
        .insert(
          ClassroomStudentsCompanion.insert(
            id: _uuid.v4(),
            classroomId: classroomId,
            studentId: studentId,
          ),
        );
  }

  @override
  Future<void> unenrollStudent({
    required String classroomId,
    required String studentId,
  }) async {
    await (_db.update(_db.classroomStudents)..where(
          (t) =>
              t.classroomId.equals(classroomId) & t.studentId.equals(studentId),
        ))
        .write(
          ClassroomStudentsCompanion(
            deletedAt: Value(DateTime.now()),
            revision: const Value(2),
          ),
        );
  }
}
