import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/learning_objectives/learning_objective_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/learning_objective_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final learningObjectiveRepositoryProvider =
    Provider<LearningObjectiveRepository>((ref) {
      final db = ref.watch(databaseProvider);
      return LearningObjectiveRepositoryImpl(db);
    });

final learningObjectiveListProvider =
    StreamProvider.family<List<LearningObjective>, String>((ref, classroomId) {
      return ref
          .watch(learningObjectiveRepositoryProvider)
          .watchLearningObjectives(classroomId);
    });
