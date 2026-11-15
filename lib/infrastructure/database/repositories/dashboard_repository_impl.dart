import 'package:drift/drift.dart';

import '../../../domain/dashboard/dashboard_repository.dart';
import '../app_database.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._db);
  final AppDatabase _db;

  @override
  Future<Map<String, int>> getDashboardStats() async {
    final students = await _db.students.count().getSingle();
    final subjects = await _db.subjects.count().getSingle();
    final documents = await _db.sourceDocuments.count().getSingle();
    final questions = await _db.questions.count().getSingle();
    final assessments = await _db.assessments.count().getSingle();

    return {
      'students': students,
      'subjects': subjects,
      'documents': documents,
      'questions': questions,
      'assessments': assessments,
    };
  }
}
