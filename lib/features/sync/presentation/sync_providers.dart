import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/device_id_provider.dart';
import '../../../domain/sync/sync_service.dart';
import '../../../infrastructure/sync/sync_service_impl.dart';
import '../../students/presentation/student_providers.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  final db = ref.watch(databaseProvider);
  final deviceId = ref.watch(localDeviceIdProvider);
  return SyncServiceImpl(
    db,
    localDeviceId: deviceId,
    localDisplayName: 'EduMonitor Guru',
  );
});
