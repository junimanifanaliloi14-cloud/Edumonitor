import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/progress/progress_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/progress_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ProgressRepositoryImpl(db);
});

final studentAttemptsProvider =
    StreamProvider.family<List<StudentAttempt>, String>((ref, studentId) {
      final repo = ref.watch(progressRepositoryProvider);
      return repo.watchAttemptsByStudent(studentId);
    });
