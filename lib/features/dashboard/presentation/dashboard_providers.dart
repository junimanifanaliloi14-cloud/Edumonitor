import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/dashboard/dashboard_repository.dart';
import '../../../infrastructure/database/repositories/dashboard_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DashboardRepositoryImpl(db);
});

/// StreamProvider: setiap kali DB berubah, dashboard auto-update.
final dashboardStatsProvider = StreamProvider<Map<String, int>>((ref) {
  final repo = ref.watch(dashboardRepositoryProvider);
  return repo.watchDashboardStats();
});
