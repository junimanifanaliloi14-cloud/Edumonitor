import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../curriculum/presentation/subject_providers.dart';
import 'classroom_providers.dart';
import 'learning_objective_providers.dart';

class ClassroomDetailScreen extends ConsumerWidget {
  final Classroom classroom;
  const ClassroomDetailScreen({super.key, required this.classroom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsAsync = ref.watch(subjectListProvider);
    final subjectName = subjectsAsync.when(
      data: (subjects) =>
          subjects
              .where((s) => s.id == classroom.subjectId)
              .map((s) => s.name)
              .firstOrNull ??
          '-',
      loading: () => '...',
      error: (_, _) => '-',
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(classroom.name),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Siswa', icon: Icon(Icons.people)),
              Tab(text: 'Tujuan Pembelajaran', icon: Icon(Icons.flag)),
            ],
          ),
        ),
        body: Column(
          children: [
            _InfoCard(classroom: classroom, subjectName: subjectName),
            const Divider(height: 1),
            Expanded(
              child: TabBarView(
                children: [
                  _StudentsTab(classroom: classroom),
                  _LearningObjectivesTab(classroom: classroom),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Classroom classroom;
  final String subjectName;
  const _InfoCard({required this.classroom, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.teal.shade50,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subjectName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                '${classroom.academicYear} · ${classroom.semester}',
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TAB 1: SISWA
// ==========================================

class _StudentsTab extends ConsumerWidget {
  final Classroom classroom;
  const _StudentsTab({required this.classroom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(classroomStudentsProvider(classroom.id));

    return Scaffold(
      body: studentsAsync.when(
        data: (students) {
          if (students.isEmpty) {
            return const Center(child: Text('Belum ada siswa di kelas ini.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: students.length,
            itemBuilder: (context, index) {
              return _StudentTile(
                student: students[index],
                classroom: classroom,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showEnrollDialog(context, ref),
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.person_add),
        label: const Text('Daftarkan Siswa'),
      ),
    );
  }

  void _showEnrollDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pilih Siswa untuk Didaftarkan'),
        content: SizedBox(
          width: 400,
          height: 400,
          child: Consumer(
            builder: (context, ref, child) {
              final availableAsync = ref.watch(
                availableStudentsProvider(classroom.id),
              );
              return availableAsync.when(
                data: (students) {
                  if (students.isEmpty) {
                    return const Center(
                      child: Text(
                        'Semua siswa sudah terdaftar.\n\n'
                        'Tambahkan siswa baru di tab "Siswa" terlebih dahulu.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal.shade100,
                          child: Text(
                            student.displayName.isNotEmpty
                                ? student.displayName[0].toUpperCase()
                                : '?',
                            style: const TextStyle(color: Colors.teal),
                          ),
                        ),
                        title: Text(student.displayName),
                        trailing: const Icon(Icons.add, color: Colors.teal),
                        onTap: () async {
                          await ref
                              .read(classroomRepositoryProvider)
                              .enrollStudent(
                                classroomId: classroom.id,
                                studentId: student.id,
                              );
                          if (ctx.mounted) Navigator.pop(ctx);
                        },
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}

class _StudentTile extends ConsumerWidget {
  final Student student;
  final Classroom classroom;
  const _StudentTile({required this.student, required this.classroom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.shade100,
          child: Text(
            student.displayName.isNotEmpty
                ? student.displayName[0].toUpperCase()
                : '?',
            style: const TextStyle(color: Colors.teal),
          ),
        ),
        title: Text(student.displayName),
        subtitle: Text('ID: ${student.id.substring(0, 8)}...'),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
          tooltip: 'Keluarkan dari kelas',
          onPressed: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Keluarkan Siswa?'),
                content: Text(
                  '${student.displayName} akan dikeluarkan dari kelas '
                  '"${classroom.name}".\n\n'
                  'Data nilai dan riwayat tetap aman.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => Navigator.pop(ctx, true),
                    child: const Text(
                      'Keluarkan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
            if (confirmed == true) {
              await ref
                  .read(classroomRepositoryProvider)
                  .unenrollStudent(
                    classroomId: classroom.id,
                    studentId: student.id,
                  );
            }
          },
        ),
      ),
    );
  }
}

// ==========================================
// TAB 2: TUJUAN PEMBELAJARAN (TP)
// ==========================================

class _LearningObjectivesTab extends ConsumerWidget {
  final Classroom classroom;
  const _LearningObjectivesTab({required this.classroom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final losAsync = ref.watch(learningObjectiveListProvider(classroom.id));

    return Scaffold(
      body: losAsync.when(
        data: (los) {
          if (los.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Belum Ada Tujuan Pembelajaran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tambahkan TP seperti "7.1 - Operasi bilangan bulat".\n'
                      'TP akan dipakai untuk mengelompokkan materi, soal, '
                      'dan analisis penguasaan siswa.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, height: 1.5),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: los.length,
            itemBuilder: (context, index) {
              final lo = los[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade100,
                    child: Text(
                      lo.code,
                      style: const TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  title: Text(lo.description),
                  subtitle: Text('Kode: ${lo.code} · Urutan: ${lo.sequence}'),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) async {
                      if (value == 'edit') {
                        _showEditDialog(context, ref, lo);
                      } else if (value == 'delete') {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Hapus TP?'),
                            content: Text(
                              'TP "${lo.code} - ${lo.description}" '
                              'akan dihapus.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Batal'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text(
                                  'Hapus',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                        if (confirmed == true) {
                          await ref
                              .read(learningObjectiveRepositoryProvider)
                              .deleteLearningObjective(lo.id);
                        }
                      }
                    },
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                        value: 'edit',
                        child: ListTile(
                          leading: Icon(Icons.edit, color: Colors.blue),
                          title: Text('Edit'),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: ListTile(
                          leading: Icon(Icons.delete, color: Colors.red),
                          title: Text('Hapus'),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => _showEditDialog(context, ref, lo),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateDialog(context, ref),
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.add),
        label: const Text('Tujuan Pembelajaran'),
      ),
    );
  }

  void _showCreateDialog(BuildContext context, WidgetRef ref) {
    final codeController = TextEditingController();
    final descController = TextEditingController();
    final sequenceController = TextEditingController(text: '1');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tambah Tujuan Pembelajaran'),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: 'Kode TP',
                    hintText: 'Contoh: 7.1',
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi TP',
                    hintText: 'Contoh: Operasi bilangan bulat',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: sequenceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Urutan',
                    border: OutlineInputBorder(),
                  ),
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
              final code = codeController.text.trim();
              final desc = descController.text.trim();
              final seq = int.tryParse(sequenceController.text) ?? 1;
              if (code.isEmpty || desc.isEmpty) return;

              await ref
                  .read(learningObjectiveRepositoryProvider)
                  .createLearningObjective(
                    classroomId: classroom.id,
                    code: code,
                    description: desc,
                    sequence: seq,
                  );
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    LearningObjective lo,
  ) {
    final codeController = TextEditingController(text: lo.code);
    final descController = TextEditingController(text: lo.description);
    final sequenceController = TextEditingController(
      text: lo.sequence.toString(),
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Tujuan Pembelajaran'),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: 'Kode TP',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi TP',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: sequenceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Urutan',
                    border: OutlineInputBorder(),
                  ),
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
              await ref
                  .read(learningObjectiveRepositoryProvider)
                  .updateLearningObjective(
                    id: lo.id,
                    code: codeController.text.trim(),
                    description: descController.text.trim(),
                    sequence: int.tryParse(sequenceController.text) ?? 1,
                  );
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Simpan Perubahan'),
          ),
        ],
      ),
    );
  }
}
