class SyncPeer {
  const SyncPeer({
    required this.deviceId,
    required this.displayName,
    required this.ipAddress,
    required this.port,
    required this.isTrusted,
  });

  final String deviceId;
  final String displayName;
  final String ipAddress;
  final int port;
  final bool isTrusted;
}
