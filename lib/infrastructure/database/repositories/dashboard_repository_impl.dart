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

  @override
  Stream<Map<String, int>> watchDashboardStats() {
    return _db
        .customSelect(
          '''
          SELECT
            (SELECT COUNT(*) FROM students) AS students,
            (SELECT COUNT(*) FROM subjects) AS subjects,
            (SELECT COUNT(*) FROM source_documents) AS documents,
            (SELECT COUNT(*) FROM questions) AS questions,
            (SELECT COUNT(*) FROM assessments) AS assessments
          ''',
          readsFrom: {
            _db.students,
            _db.subjects,
            _db.sourceDocuments,
            _db.questions,
            _db.assessments,
          },
        )
        .watchSingle()
        .map(
          (row) => {
            'students': row.read<int>('students'),
            'subjects': row.read<int>('subjects'),
            'documents': row.read<int>('documents'),
            'questions': row.read<int>('questions'),
            'assessments': row.read<int>('assessments'),
          },
        );
  }
}
