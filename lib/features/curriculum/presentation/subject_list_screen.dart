import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_snackbar.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../infrastructure/database/app_database.dart';
import 'chapter_list_screen.dart';
import 'subject_providers.dart';

class SubjectListScreen extends ConsumerWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsAsync = ref.watch(subjectListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Pelajaran'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: subjectsAsync.when(
        data: (subjects) {
          if (subjects.isEmpty) {
            return EmptyState(
              icon: Icons.menu_book_outlined,
              title: 'Belum Ada Mata Pelajaran',
              description: 'Tambahkan mata pelajaran seperti Matematika, Fisika, atau Biologi untuk mulai menyusun kurikulum.',
              actionLabel: 'Tambah Mata Pelajaran',
              onAction: () => _showAddDialog(context, ref),
            );
          }
          return ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return ListTile(
                leading: const Icon(Icons.book, color: Colors.teal),
                title: Text(subject.name),
                subtitle: Text('Engine: ${subject.engineId}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChapterListScreen(subject: subject),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmDelete(context, ref, subject),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, ref),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    String selectedEngine = 'generic';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Tambah Mata Pelajaran'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pelajaran',
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: selectedEngine,
                  decoration: const InputDecoration(labelText: 'Engine'),
                  items: const [
                    DropdownMenuItem(value: 'generic', child: Text('Generic')),
                    DropdownMenuItem(value: 'math', child: Text('Mathematics')),
                    DropdownMenuItem(value: 'physics', child: Text('Physics')),
                    DropdownMenuItem(value: 'biology', child: Text('Biology')),
                    DropdownMenuItem(
                      value: 'chemistry',
                      child: Text('Chemistry'),
                    ),
                  ],
                  onChanged: (val) {
                    if (val != null) setState(() => selectedEngine = val);
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final name = nameController.text.trim();
                  if (name.isNotEmpty) {
                    await ref
                        .read(subjectRepositoryProvider)
                        .addSubject(name, selectedEngine);
                    if (ctx.mounted) Navigator.pop(ctx);
                    if (context.mounted) {
                      AppSnackbar.success(
                        context,
                        'Mata pelajaran $name ditambahkan',
                      );
                    }
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Subject subject) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Mata Pelajaran?'),
        content: Text('Yakin ingin menghapus ${subject.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await ref
                  .read(subjectRepositoryProvider)
                  .deleteSubject(subject.id);
              if (ctx.mounted) Navigator.pop(ctx);
              if (context.mounted) {
                AppSnackbar.success(context, 'Mata pelajaran dihapus');
              }
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
