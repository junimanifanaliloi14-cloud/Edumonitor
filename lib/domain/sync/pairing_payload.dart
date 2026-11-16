import 'dart:convert';

class PairingPayload {
  const PairingPayload({
    required this.deviceId,
    required this.displayName,
    required this.ipAddress,
    required this.port,
    required this.oneTimeToken,
  });

  final String deviceId;
  final String displayName;
  final String ipAddress;
  final int port;
  final String oneTimeToken;

  String toJson() => jsonEncode({
    'deviceId': deviceId,
    'displayName': displayName,
    'ipAddress': ipAddress,
    'port': port,
    'oneTimeToken': oneTimeToken,
  });

  factory PairingPayload.fromJson(String source) {
    final map = jsonDecode(source) as Map<String, dynamic>;
    return PairingPayload(
      deviceId: map['deviceId'] as String,
      displayName: map['displayName'] as String,
      ipAddress: map['ipAddress'] as String,
      port: map['port'] as int,
      oneTimeToken: map['oneTimeToken'] as String,
    );
  }
}
