import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/providers/device_id_provider.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/students/presentation/student_providers.dart';
import 'infrastructure/backup/backup_service_impl.dart';
import 'infrastructure/database/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Buka database
  final dbExecutor = await openAppDatabase();
  final appDatabase = AppDatabase(dbExecutor);

  // 2. Baca atau generate Device ID permanen (Phase 11 v9)
  //    Tanpa ini, sync events akan throw UnimplementedError saat dipakai
  final deviceId = await getOrCreateDeviceId(appDatabase);

  // 3. Auto-backup di background (Phase 17D, non-blocking)
  //    Timeout 15 detik; gagal auto-backup tidak boleh menghalangi startup
  final backupService = BackupServiceImpl(appDatabase);
  try {
    await backupService.runAutoBackupIfDue().timeout(
      const Duration(seconds: 15),
    );
  } catch (e) {
    debugPrint('Auto-backup skipped: $e');
  }

  // 4. Jalankan aplikasi dengan provider overrides
  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(appDatabase),
        localDeviceIdProvider.overrideWithValue(deviceId),
      ],
      child: const EduMonitorApp(),
    ),
  );
}

class EduMonitorApp extends StatelessWidget {
  const EduMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduMonitor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const HomeScreen(),
    );
  }
}
