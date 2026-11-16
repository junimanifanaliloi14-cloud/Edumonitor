import 'dart:io';

import '../../../domain/documents/parsers/document_parser.dart';

/// Logika chunking teks yang reusable dan mudah diuji.
///
/// Strategi bertingkat:
/// 1. Pisah berdasarkan baris kosong ganda (paling andal untuk teks terstruktur).
/// 2. Jika hanya 1 chunk, coba pisah per baris tunggal.
/// 3. Jika masih 1 chunk, pisah per kalimat (akhir kalimat `. ! ?` + huruf kapital).
/// 4. Fallback: seluruh teks jadi 1 chunk.
class TxtChunker {
  static List<String> chunk(String text) {
    final normalized = text
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .trim();
    if (normalized.isEmpty) return <String>[];

    // 1. Blank line separation
    final blankLineChunks = normalized
        .split(RegExp(r'\n\s*\n'))
        .map(_clean)
        .where((p) => p.isNotEmpty)
        .toList();
    if (blankLineChunks.length > 1) return blankLineChunks;

    // 2. Single newlines
    final lineChunks = normalized
        .split('\n')
        .map(_clean)
        .where((p) => p.isNotEmpty)
        .toList();
    if (lineChunks.length > 1) {
      final sentenceChunks = _splitBySentences(normalized);
      return sentenceChunks.length > lineChunks.length
          ? sentenceChunks
          : lineChunks;
    }

    // 3. Sentence split (single block)
    final sentenceChunks = _splitBySentences(normalized);
    if (sentenceChunks.length > 1) return sentenceChunks;

    // 4. Fallback
    return <String>[normalized];
  }

  static List<String> _splitBySentences(String text) {
    return text
        .split(RegExp(r'(?<=[.!?])\s+(?=[A-Z])'))
        .map(_clean)
        .where((p) => p.isNotEmpty)
        .toList();
  }

  static String _clean(String s) => s.replaceAll(RegExp(r'\s+'), ' ').trim();
}

class TxtParser implements DocumentParser {
  @override
  Future<List<String>> extractParagraphs(String filePath) async {
    final content = await File(filePath).readAsString();
    return TxtChunker.chunk(content);
  }
}
