import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import 'student_providers.dart';

class StudentListScreen extends ConsumerWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(studentListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Siswa'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: studentsAsync.when(
        data: (students) {
          if (students.isEmpty) {
            return const Center(
              child: Text('Belum ada siswa. Tambahkan sekarang!'),
            );
          }
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.shade100,
                  child: Text(
                    student.displayName[0].toUpperCase(),
                    style: const TextStyle(color: Colors.teal),
                  ),
                ),
                title: Text(student.displayName),
                subtitle: Text('ID: ${student.id.substring(0, 8)}...'),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      _showEditDialog(context, ref, student);
                    } else if (value == 'delete') {
                      _confirmDelete(context, ref, student);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: ListTile(
                            leading: Icon(Icons.edit, color: Colors.blue),
                            title: Text('Edit Nama'),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: ListTile(
                            leading: Icon(Icons.delete, color: Colors.red),
                            title: Text('Hapus'),
                          ),
                        ),
                      ],
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
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Siswa'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Nama Siswa',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                await ref.read(studentRepositoryProvider).addStudent(name);
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, WidgetRef ref, Student student) {
    final controller = TextEditingController(text: student.displayName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Nama Siswa'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Nama Siswa',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                await ref
                    .read(studentRepositoryProvider)
                    .updateStudent(student.id, name);
                if (context.mounted) Navigator.pop(context);
              }
            },
            child: const Text('Simpan Perubahan'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Student student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Siswa?'),
        content: Text(
          'Apakah Anda yakin ingin menghapus ${student.displayName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await ref
                  .read(studentRepositoryProvider)
                  .deleteStudent(student.id);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
