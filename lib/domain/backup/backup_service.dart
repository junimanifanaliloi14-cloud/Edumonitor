class AutoBackupInfo {
  const AutoBackupInfo({
    required this.filePath,
    required this.createdAt,
    required this.sizeBytes,
  });
  final String filePath;
  final DateTime createdAt;
  final int sizeBytes;
}

class AutoBackupResult {
  const AutoBackupResult({
    required this.filePath,
    required this.createdAt,
    required this.removedOldCount,
  });
  final String filePath;
  final DateTime createdAt;
  final int removedOldCount;
}

abstract interface class BackupService {
  Future<String?> exportBackup();
  Future<void> importBackup(String zipPath);

  Future<bool> isAutoBackupEnabled();
  Future<void> setAutoBackupEnabled(bool enabled);
  Future<DateTime?> getLastAutoBackupAt();
  Future<AutoBackupResult?> runAutoBackupIfDue();
  Future<List<AutoBackupInfo>> listAutoBackups();
}
