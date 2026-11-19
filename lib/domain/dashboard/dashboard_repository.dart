abstract interface class DashboardRepository {
  Future<Map<String, int>> getDashboardStats();

  /// Stream yang emit setiap kali ada perubahan di salah satu tabel.
  Stream<Map<String, int>> watchDashboardStats();
}
