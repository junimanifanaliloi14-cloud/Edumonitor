import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

import '../../../domain/documents/parsers/document_parser.dart';

class DocxParser implements DocumentParser {
  @override
  Future<List<String>> extractParagraphs(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    final file = archive.findFile('word/document.xml');
    if (file == null) {
      throw Exception('File DOCX tidak valid (document.xml tidak ditemukan).');
    }

    final content = file.content as List<int>;
    final xmlString = utf8.decode(content);
    final document = XmlDocument.parse(xmlString);

    final paragraphs = <String>[];

    // Iterasi per <w:p> (paragraph Word)
    for (final para in document.findAllElements('w:p')) {
      final buf = StringBuffer();
      _extractNode(para, buf);

      // Normalisasi spasi berlebih dalam satu baris
      final text = buf
          .toString()
          .split('\n')
          .map((line) => line.replaceAll(RegExp(r'[ \t]+'), ' ').trim())
          .where((line) => line.isNotEmpty)
          .join('\n')
          .trim();

      if (text.isNotEmpty) {
        paragraphs.add(text);
      }
    }

    // Fallback: jika tidak ada paragraph yang terekstrak, kembalikan 1 chunk
    if (paragraphs.isEmpty) {
      final fallbackBuf = StringBuffer();
      for (final t in document.findAllElements('w:t')) {
        fallbackBuf.write(t.innerText);
        fallbackBuf.write(' ');
      }
      final text = fallbackBuf.toString().trim();
      if (text.isNotEmpty) paragraphs.add(text);
    }

    return paragraphs;
  }

  /// Ekstrak teks dari node XML secara rekursif, mempertahankan urutan.
  /// - `<w:t>` → teks
  /// - `<w:br>` → newline
  /// - `<w:tab>` → tab
  /// - `<w:drawing>`, `<w:pict>` → skip (gambar, bukan teks)
  void _extractNode(XmlNode node, StringBuffer buf) {
    if (node is XmlElement) {
      final localName = node.name.local;

      switch (localName) {
        case 'drawing':
        case 'pict':
          return; // Skip gambar
        case 't':
          buf.write(node.innerText);
          return;
        case 'br':
          buf.write('\n');
          return;
        case 'tab':
          buf.write('\t');
          return;
      }
    }

    for (final child in node.children) {
      _extractNode(child, buf);
    }
  }
}
