import 'dart:io';

import '../../../domain/documents/parsers/document_parser.dart';

class TxtParser implements DocumentParser {
  @override
  Future<List<String>> extractParagraphs(String filePath) async {
    final content = await File(filePath).readAsString();
    return _chunkText(content);
  }

  List<String> _chunkText(String text) {
    // Pisahkan berdasarkan baris kosong (minimal 2 newline)
    return text
        .split(RegExp(r'\n\s*\n'))
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();
  }
}
