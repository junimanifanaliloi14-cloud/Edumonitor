import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/curriculum/subject_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/subject_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final subjectRepositoryProvider = Provider<SubjectRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return SubjectRepositoryImpl(db);
});

final subjectListProvider = StreamProvider<List<Subject>>((ref) {
  final repo = ref.watch(subjectRepositoryProvider);
  return repo.watchAllSubjects();
});
