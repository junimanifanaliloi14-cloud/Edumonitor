import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/backup/backup_service.dart';
import '../../../infrastructure/backup/backup_service_impl.dart';
import '../../students/presentation/student_providers.dart';

final backupServiceProvider = Provider<BackupService>((ref) {
  final db = ref.watch(databaseProvider);
  return BackupServiceImpl(db);
});
