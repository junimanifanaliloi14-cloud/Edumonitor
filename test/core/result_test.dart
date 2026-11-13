import 'package:edumonitor/core/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    test('Ok holds value and isOk', () {
      const r = Ok<int, String>(42);
      expect(r.value, 42);
      expect(r.isOk, isTrue);
      expect(r.isErr, isFalse);
    });

    test('Err holds error and isErr', () {
      const r = Err<int, String>('boom');
      expect(r.error, 'boom');
      expect(r.isOk, isFalse);
      expect(r.isErr, isTrue);
    });
  });
}
