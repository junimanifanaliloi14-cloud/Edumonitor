import '../../infrastructure/database/app_database.dart';

abstract interface class StudentRepository {
  Stream<List<Student>> watchAllStudents();
  Future<void> addStudent(String name);
}
