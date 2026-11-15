import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../infrastructure/database/app_database.dart';
import 'document_detail_screen.dart';
import 'document_providers.dart';

class DocumentListScreen extends ConsumerWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final docsAsync = ref.watch(documentListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pustaka Materi'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: docsAsync.when(
        data: (docs) {
          if (docs.isEmpty) {
            return EmptyState(
              icon: Icons.folder_open_outlined,
              title: 'Pustaka Materi Kosong',
              description: 'Unggah file PDF, DOCX, atau TXT sebagai bahan ajar. Sistem akan mengekstrak teks untuk dijadikan soal.',
              actionLabel: 'Unggah File',
              onAction: () => _pickFile(context, ref),
            );
          }
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              IconData icon = Icons.insert_drive_file;
              if (doc.fileType == 'pdf') icon = Icons.picture_as_pdf;
              if (doc.fileType == 'docx') icon = Icons.description;

              return ListTile(
                leading: Icon(icon, color: Colors.teal, size: 32),
                title: Text(doc.title),
                subtitle: Text(
                  '${doc.fileType.toUpperCase()} • ${doc.filePath.split(RegExp(r"[/\\]")).last}',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DocumentDetailScreen(document: doc),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmDelete(context, ref, doc),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _pickFile(context, ref),
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.upload_file),
        label: const Text('Unggah File'),
      ),
    );
  }

  Future<void> _pickFile(BuildContext context, WidgetRef ref) async {
    try {
      final PlatformFile? file = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx', 'txt'],
      );

      if (file != null && file.path != null) {
        final path = file.path!;
        final ext = file.extension ?? 'unknown';
        final tempHash = const Uuid().v4();

        await ref
            .read(documentRepositoryProvider)
            .addDocument(
              title: file.name,
              filePath: path,
              fileHash: tempHash,
              fileType: ext,
            );
        if (context.mounted) {
          AppSnackbar.success(
            context,
            'Dokumen ${file.name} berhasil diunggah',
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        AppSnackbar.error(context, 'Gagal memilih file: $e');
      }
    }
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, SourceDocument doc) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Dokumen?'),
        content: Text('Yakin ingin menghapus ${doc.title}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await ref.read(documentRepositoryProvider).deleteDocument(doc.id);
              if (ctx.mounted) Navigator.pop(ctx);
              if (context.mounted) {
                AppSnackbar.success(context, 'Dokumen berhasil dihapus');
              }
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
