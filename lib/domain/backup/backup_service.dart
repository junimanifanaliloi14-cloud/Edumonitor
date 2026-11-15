abstract interface class BackupService {
  /// Menyimpan backup ke lokasi pilihan user. Return path atau null jika dibatalkan.
  Future<String?> exportBackup();

  /// Memulihkan database dari file backup. Wajib restart aplikasi setelahnya.
  Future<void> importBackup(String zipPath);
}
