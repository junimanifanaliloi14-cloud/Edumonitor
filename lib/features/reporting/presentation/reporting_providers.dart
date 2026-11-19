import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/reporting/reporting_models.dart';
import '../../../domain/reporting/reporting_repository.dart';
import '../../../infrastructure/database/repositories/reporting_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final reportingRepositoryProvider = Provider<ReportingRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ReportingRepositoryImpl(db);
});

final reportingMetricsProvider = FutureProvider<ReportingMetrics>((ref) async {
  final repo = ref.watch(reportingRepositoryProvider);
  return repo.getMetrics();
});
