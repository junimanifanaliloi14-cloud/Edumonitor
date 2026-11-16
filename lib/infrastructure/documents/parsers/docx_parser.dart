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

    // Ekstrak teks dari tag <w:t> (teks di dalam Word)
    final textBuffer = StringBuffer();
    for (final node in document.findAllElements('w:t')) {
      // Perbaikan: gunakan .innerText sebagai ganti .text yang deprecated
      textBuffer.write(node.innerText);
      textBuffer.write(' '); // spasi antar baris
    }

    return _chunkText(textBuffer.toString());
  }

  List<String> _chunkText(String text) {
    return text
        .split(RegExp(r'\n\s*\n'))
        .map((p) => p.trim().replaceAll(RegExp(r'\s+'), ' '))
        .where((p) => p.isNotEmpty)
        .toList();
  }
}
