import 'package:uuid/uuid.dart';

/// Abstraction so that tests can inject deterministic IDs.
abstract interface class IdGenerator {
  String newId();
}

/// Default implementation using UUID v4.
///
/// UUID v4 is used for Phase 1A for maximum compatibility.
/// Can migrate to UUID v7 in Phase 2 for better index locality.
final class UuidV4Generator implements IdGenerator {
  UuidV4Generator({Uuid? uuid}) : _uuid = uuid ?? const Uuid();
  final Uuid _uuid;

  @override
  String newId() => _uuid.v4();
}
