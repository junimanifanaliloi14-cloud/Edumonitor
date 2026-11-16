import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Device ID lokal untuk MVP.
/// Di fase lanjut, ID ini akan dipersistenkan di tabel Devices.
final localDeviceIdProvider = Provider<String>((ref) {
  final random = Random();
  final suffix = random.nextInt(999999).toString().padLeft(6, '0');
  return 'edumonitor-$suffix';
});
