import '../../infrastructure/database/app_database.dart';

abstract interface class StudentRepository {
  Stream<List<Student>> watchAllStudents();
  Future<void> addStudent(String name);
  Future<void> updateStudent(String id, String newName);
  Future<void> deleteStudent(String id); // Soft delete
}
