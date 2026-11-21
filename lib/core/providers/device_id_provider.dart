import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../infrastructure/database/app_database.dart';

/// Device ID lokal untuk MVP.
/// Di fase lanjut, ID ini akan dipersistenkan di tabel Devices.
final localDeviceIdProvider = Provider<String>((ref) {
  return 'edumonitor-${const Uuid().v4()}';
});

Future<String> getOrCreateDeviceId(AppDatabase db) async {
  const key = 'local_device_id';
  final row = await (db.select(
    db.appSettings,
  )..where((table) => table.key.equals(key))).getSingleOrNull();

  if (row != null && row.value.isNotEmpty) {
    return row.value;
  }

  final deviceId = 'edumonitor-${const Uuid().v4()}';
  await db
      .into(db.appSettings)
      .insertOnConflictUpdate(
        AppSettingsCompanion.insert(key: key, value: deviceId),
      );
  return deviceId;
}
