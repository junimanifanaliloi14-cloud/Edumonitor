import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/export/export_service.dart';
import '../../../infrastructure/export/export_service_impl.dart';
import '../../students/presentation/student_providers.dart';

final exportServiceProvider = Provider<ExportService>((ref) {
  final db = ref.watch(databaseProvider);
  return ExportServiceImpl(db);
});
