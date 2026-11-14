import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/students/student_repository.dart';
import '../../../infrastructure/database/app_database.dart';
import '../../../infrastructure/database/repositories/student_repository_impl.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Database must be overridden in main.dart');
});

final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return StudentRepositoryImpl(db);
});

final studentListProvider = StreamProvider<List<Student>>((ref) {
  final repo = ref.watch(studentRepositoryProvider);
  return repo.watchAllStudents();
});
