import '../../infrastructure/database/app_database.dart';

abstract interface class ClassroomRepository {
  Stream<List<Classroom>> watchAllClassrooms();

  Future<void> createClassroom({
    required String name,
    required String subjectId,
    required String academicYear,
    required String semester,
    String? teacherNote,
  });

  Future<void> updateClassroom({
    required String id,
    String? name,
    String? academicYear,
    String? semester,
    String? teacherNote,
  });

  Future<void> deleteClassroom(String id);

  // Students in classroom
  Stream<List<Student>> watchStudentsInClassroom(String classroomId);

  Stream<List<Student>> watchAvailableStudents(String classroomId);

  Future<void> enrollStudent({
    required String classroomId,
    required String studentId,
  });

  Future<void> unenrollStudent({
    required String classroomId,
    required String studentId,
  });
}
