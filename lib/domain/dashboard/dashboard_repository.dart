abstract interface class DashboardRepository {
  Future<Map<String, int>> getDashboardStats();
}
