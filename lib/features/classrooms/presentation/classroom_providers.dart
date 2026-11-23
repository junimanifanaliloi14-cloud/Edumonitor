import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/classrooms/classroom_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/classroom_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final classroomRepositoryProvider = Provider<ClassroomRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ClassroomRepositoryImpl(db);
});

final classroomListProvider = StreamProvider<List<Classroom>>((ref) {
  return ref.watch(classroomRepositoryProvider).watchAllClassrooms();
});

final classroomStudentsProvider = StreamProvider.family<List<Student>, String>((
  ref,
  classroomId,
) {
  return ref
      .watch(classroomRepositoryProvider)
      .watchStudentsInClassroom(classroomId);
});

final availableStudentsProvider = StreamProvider.family<List<Student>, String>((
  ref,
  classroomId,
) {
  return ref
      .watch(classroomRepositoryProvider)
      .watchAvailableStudents(classroomId);
});
