import 'dart:io';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/documents/document_repository.dart';
import '../../documents/parsers/docx_parser.dart';
import '../../documents/parsers/pdf_parser.dart';
import '../../documents/parsers/txt_parser.dart';
import '../app_database.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  DocumentRepositoryImpl(this._db);
  final AppDatabase _db;
  final _uuid = const Uuid();

  @override
  Stream<List<SourceDocument>> watchAllDocuments() {
    return (_db.select(_db.sourceDocuments)
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  @override
  Future<void> addDocument({
    required String title,
    required String filePath,
    required String fileHash,
    required String fileType,
  }) async {
    await _db
        .into(_db.sourceDocuments)
        .insert(
          SourceDocumentsCompanion.insert(
            id: _uuid.v4(),
            title: title,
            filePath: filePath,
            fileHash: fileHash,
            fileType: fileType,
          ),
        );
  }

  @override
  Future<void> deleteDocument(String id) async {
    await (_db.update(
      _db.sourceDocuments,
    )..where((t) => t.id.equals(id))).write(
      SourceDocumentsCompanion(
        deletedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Stream<List<DocumentChunk>> watchChunksByDocument(String documentId) {
    final query =
        (_db.select(_db.documentChunks).join([
            innerJoin(
              _db.documentVersions,
              _db.documentVersions.id.equalsExp(_db.documentChunks.versionId),
            ),
          ]))
          ..where(_db.documentVersions.documentId.equals(documentId))
          ..orderBy([OrderingTerm.asc(_db.documentChunks.sequence)]);

    return query.watch().map((rows) {
      return rows.map((row) => row.readTable(_db.documentChunks)).toList();
    });
  }

  @override
  Future<void> processDocument(SourceDocument doc) async {
    final file = File(doc.filePath);
    if (!await file.exists()) {
      throw Exception('File tidak ditemukan di path: ${doc.filePath}');
    }

    List<String> paragraphs;

    // Routing Parser berdasarkan ekstensi file
    switch (doc.fileType.toLowerCase()) {
      case 'txt':
        paragraphs = await TxtParser().extractParagraphs(doc.filePath);
        break;
      case 'pdf':
        paragraphs = await PdfParser().extractParagraphs(doc.filePath);
        break;
      case 'docx':
        paragraphs = await DocxParser().extractParagraphs(doc.filePath);
        break;
      default:
        throw Exception('Format file .${doc.fileType} belum didukung.');
    }

    if (paragraphs.isEmpty) {
      throw Exception(
        'Tidak ada teks yang berhasil diekstrak dari dokumen ini.',
      );
    }

    // Buat DocumentVersion baru
    final versionId = _uuid.v4();
    await _db
        .into(_db.documentVersions)
        .insert(
          DocumentVersionsCompanion.insert(
            id: versionId,
            documentId: doc.id,
            versionNumber: 1,
          ),
        );

    // Simpan setiap paragraf
    for (int i = 0; i < paragraphs.length; i++) {
      await _db
          .into(_db.documentChunks)
          .insert(
            DocumentChunksCompanion.insert(
              id: _uuid.v4(),
              versionId: versionId,
              sequence: i,
              textContent: paragraphs[i],
              locator: 'paragraph:$i',
            ),
          );
    }
  }
}
