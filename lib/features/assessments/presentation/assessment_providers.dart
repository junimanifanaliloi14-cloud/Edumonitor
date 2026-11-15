import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/assessments/assessment_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/assessment_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final assessmentRepositoryProvider = Provider<AssessmentRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return AssessmentRepositoryImpl(db);
});

final assessmentListProvider = StreamProvider<List<Assessment>>((ref) {
  final repo = ref.watch(assessmentRepositoryProvider);
  return repo.watchAllAssessments();
});
