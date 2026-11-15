import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/dashboard/dashboard_repository.dart';
import '../../../infrastructure/database/repositories/dashboard_repository_impl.dart';
import '../../students/presentation/student_providers.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DashboardRepositoryImpl(db);
});

// Menggunakan FutureProvider agar data bisa di-refresh (pull-to-refresh nanti)
final dashboardStatsProvider = FutureProvider<Map<String, int>>((ref) async {
  final repo = ref.watch(dashboardRepositoryProvider);
  return repo.getDashboardStats();
});
