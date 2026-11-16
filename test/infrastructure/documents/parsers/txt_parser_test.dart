import 'package:edumonitor/infrastructure/documents/parsers/txt_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TxtChunker', () {
    test('empty or whitespace-only input returns empty list', () {
      expect(TxtChunker.chunk(''), isEmpty);
      expect(TxtChunker.chunk('   \n\n  '), isEmpty);
    });

    test('single sentence returns one chunk', () {
      expect(TxtChunker.chunk('Halo dunia.'), ['Halo dunia.']);
    });

    test('splits by blank lines (double newline)', () {
      final result = TxtChunker.chunk('A satu.\n\nB dua.\n\nC tiga.');
      expect(result, ['A satu.', 'B dua.', 'C tiga.']);
    });

    test('normalizes CRLF line endings', () {
      final result = TxtChunker.chunk('A satu.\r\n\r\nB dua.\r\n\r\nC tiga.');
      expect(result, ['A satu.', 'B dua.', 'C tiga.']);
    });

    test('splits by single newline if no blank lines present', () {
      final result = TxtChunker.chunk('A satu.\nB dua.\nC tiga.');
      expect(result, ['A satu.', 'B dua.', 'C tiga.']);
    });

    test('splits by sentence if single block has multiple sentences', () {
      final result = TxtChunker.chunk(
        'Gaya adalah tarikan. Massa adalah materi. Berat adalah gravitasi.',
      );
      expect(result.length, 3);
      expect(result[0], 'Gaya adalah tarikan.');
      expect(result[1], 'Massa adalah materi.');
      expect(result[2], 'Berat adalah gravitasi.');
    });

    test('does not split inside decimal numbers', () {
      final result = TxtChunker.chunk('Nilai 85.5 adalah bagus.');
      expect(result, ['Nilai 85.5 adalah bagus.']);
    });

    test('collapses multiple whitespace into single space', () {
      final result = TxtChunker.chunk('A   dengan     spasi.\n\nB normal.');
      expect(result, ['A dengan spasi.', 'B normal.']);
    });
  });
}
