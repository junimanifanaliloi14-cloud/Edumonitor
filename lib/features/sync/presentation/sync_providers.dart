import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/sync/sync_service.dart';
import '../../../infrastructure/sync/sync_service_impl.dart';
import '../../students/presentation/student_providers.dart';

/// Device ID lokal. Untuk MVP, dibuat sekali per sesi aplikasi.
/// Di Sesi 3 akan dipersistenkan ke tabel Devices.
final localDeviceIdProvider = Provider<String>((ref) {
  final random = Random();
  final suffix = random.nextInt(999999).toString().padLeft(6, '0');
  return 'edumonitor-$suffix';
});

final syncServiceProvider = Provider<SyncService>((ref) {
  final db = ref.watch(databaseProvider);
  final deviceId = ref.watch(localDeviceIdProvider);
  return SyncServiceImpl(
    db,
    localDeviceId: deviceId,
    localDisplayName: 'EduMonitor Guru',
  );
});
