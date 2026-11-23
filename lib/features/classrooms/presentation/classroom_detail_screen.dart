import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../curriculum/presentation/subject_providers.dart';
import 'classroom_providers.dart';

class ClassroomDetailScreen extends ConsumerWidget {
  final Classroom classroom;
  const ClassroomDetailScreen({super.key, required this.classroom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentsAsync = ref.watch(classroomStudentsProvider(classroom.id));
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

    return Scaffold(
      appBar: AppBar(
        title: Text(classroom.name),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _InfoCard(classroom: classroom, subjectName: subjectName),
          const Divider(height: 1),
          Expanded(
            child: studentsAsync.when(
              data: (students) {
                if (students.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Belum ada siswa di kelas ini',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tap tombol "+" di bawah untuk mendaftarkan siswa.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return _StudentTile(student: student, classroom: classroom);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
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
          onPressed: () => _confirmUnenroll(context, ref),
        ),
      ),
    );
  }

  Future<void> _confirmUnenroll(BuildContext context, WidgetRef ref) async {
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
          .unenrollStudent(classroomId: classroom.id, studentId: student.id);
    }
  }
}
