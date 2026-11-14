import '../../infrastructure/database/app_database.dart';

abstract interface class SubjectRepository {
  Stream<List<Subject>> watchAllSubjects();
  Future<void> addSubject(String name, String engineId);
  Future<void> deleteSubject(String id);
}
