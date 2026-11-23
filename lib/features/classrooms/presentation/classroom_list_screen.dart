import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../curriculum/presentation/subject_providers.dart';
import 'classroom_detail_screen.dart';
import 'classroom_providers.dart';

class ClassroomListScreen extends ConsumerWidget {
  const ClassroomListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomsAsync = ref.watch(classroomListProvider);
    final subjectsAsync = ref.watch(subjectListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: classroomsAsync.when(
        data: (classrooms) {
          if (classrooms.isEmpty) {
            return _EmptyClassrooms(
              onCreate: () => _showCreateDialog(context, ref),
            );
          }
          return subjectsAsync.when(
            data: (subjects) {
              final subjectMap = {for (final s in subjects) s.id: s.name};
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: classrooms.length,
                itemBuilder: (context, index) {
                  final classroom = classrooms[index];
                  return _ClassroomCard(
                    classroom: classroom,
                    subjectName: subjectMap[classroom.subjectId] ?? '-',
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateDialog(context, ref),
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.add),
        label: const Text('Kelas'),
      ),
    );
  }

  void _showCreateDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final yearController = TextEditingController(text: '2026/2027');
    String selectedSemester = 'Ganjil';
    String? selectedSubjectId;

    final subjects = ref.read(subjectListProvider).value ?? [];
    if (subjects.isNotEmpty) {
      selectedSubjectId = subjects.first.id;
    }

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Tambah Kelas'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Kelas',
                      hintText: 'Contoh: VII A',
                      border: OutlineInputBorder(),
                    ),
                    autofocus: true,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: selectedSubjectId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Mata Pelajaran',
                      border: OutlineInputBorder(),
                    ),
                    items: subjects
                        .map(
                          (s) => DropdownMenuItem(
                            value: s.id,
                            child: Text(s.name),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => selectedSubjectId = v),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: yearController,
                    decoration: const InputDecoration(
                      labelText: 'Tahun Ajaran',
                      hintText: '2026/2027',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: selectedSemester,
                    decoration: const InputDecoration(
                      labelText: 'Semester',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Ganjil', child: Text('Ganjil')),
                      DropdownMenuItem(value: 'Genap', child: Text('Genap')),
                    ],
                    onChanged: (v) {
                      if (v != null) setState(() => selectedSemester = v);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (selectedSubjectId == null) return;
                await ref
                    .read(classroomRepositoryProvider)
                    .createClassroom(
                      name: nameController.text.trim(),
                      subjectId: selectedSubjectId!,
                      academicYear: yearController.text.trim(),
                      semester: selectedSemester,
                    );
                if (ctx.mounted) Navigator.pop(ctx);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassroomCard extends ConsumerWidget {
  final Classroom classroom;
  final String subjectName;
  const _ClassroomCard({required this.classroom, required this.subjectName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentCountAsync = ref.watch(
      classroomStudentsProvider(classroom.id),
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ClassroomDetailScreen(classroom: classroom),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.groups, color: Colors.teal, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          classroom.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          subjectName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == 'delete') {
                        await _confirmDelete(context, ref);
                      }
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                        value: 'delete',
                        child: ListTile(
                          leading: Icon(Icons.delete, color: Colors.red),
                          title: Text('Hapus Kelas'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  Chip(
                    label: Text(classroom.academicYear),
                    backgroundColor: Colors.teal.shade50,
                    labelStyle: const TextStyle(fontSize: 12),
                  ),
                  Chip(
                    label: Text(classroom.semester),
                    backgroundColor: Colors.blue.shade50,
                    labelStyle: const TextStyle(fontSize: 12),
                  ),
                  studentCountAsync.when(
                    data: (students) => Chip(
                      label: Text('${students.length} Siswa'),
                      backgroundColor: Colors.orange.shade50,
                      labelStyle: const TextStyle(fontSize: 12),
                    ),
                    loading: () => const SizedBox.shrink(),
                    error: (_, _) => const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Kelas?'),
        content: Text(
          'Kelas "${classroom.name}" akan dihapus.\n\n'
          'Data siswa, asesmen, dan nilai tetap aman (tidak terhapus).',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(classroomRepositoryProvider).deleteClassroom(classroom.id);
    }
  }
}

class _EmptyClassrooms extends StatelessWidget {
  final VoidCallback onCreate;
  const _EmptyClassrooms({required this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.groups, size: 64, color: Colors.teal),
            ),
            const SizedBox(height: 24),
            const Text(
              'Belum Ada Kelas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Buat kelas pertama Anda (misal: "VII A").\n'
              'Kelas membantu mengelola siswa, materi, dan nilai per rombel.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onCreate,
              icon: const Icon(Icons.add),
              label: const Text('Buat Kelas Pertama'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
