import 'package:edumonitor/infrastructure/export/export_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CsvBuilder', () {
    test('uses semicolon delimiter between fields', () {
      final result = CsvBuilder.build([
        ['A', 'B', 'C'],
        ['1', '2', '3'],
      ]);
      expect(result, 'A;B;C\r\n1;2;3');
    });

    test('escapes semicolon inside a field', () {
      final result = CsvBuilder.build([
        ['Nama; dengan semicolon', 'B'],
      ]);
      expect(result, '"Nama; dengan semicolon";B');
    });

    test('escapes double quotes', () {
      final result = CsvBuilder.build([
        ['He said "hi"'],
      ]);
      expect(result, '"He said ""hi"""');
    });

    test('escapes newline inside a field', () {
      final result = CsvBuilder.build([
        ['Line1\nLine2'],
      ]);
      expect(result, '"Line1\nLine2"');
    });

    test('empty rows produce empty string', () {
      expect(CsvBuilder.build([]), '');
    });
  });
}
