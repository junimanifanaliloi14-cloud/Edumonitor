import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../classrooms/presentation/classroom_providers.dart';
import 'journal_form_screen.dart';
import 'journal_providers.dart';

class JournalDetailScreen extends ConsumerWidget {
  final Classroom classroom;
  final JournalEntry journalEntry;

  const JournalDetailScreen({
    super.key,
    required this.classroom,
    required this.journalEntry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendancesAsync = ref.watch(
      journalAttendancesProvider(journalEntry.id),
    );
    final studentsAsync = ref.watch(classroomStudentsProvider(classroom.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Jurnal'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => JournalFormScreen(
                    classroom: classroom,
                    existingEntry: journalEntry,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Hapus',
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.teal,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatDate(journalEntry.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  if (journalEntry.title != null &&
                      journalEntry.title!.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      journalEntry.title!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  const Text(
                    'Kegiatan:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    journalEntry.activity,
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),
                  if (journalEntry.notes != null &&
                      journalEntry.notes!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    const Text(
                      'Catatan:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      journalEntry.notes!,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Presensi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          attendancesAsync.when(
            data: (attendances) {
              if (attendances.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Presensi tidak tercatat untuk jurnal ini.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              }

              return studentsAsync.when(
                data: (students) {
                  final studentMap = {
                    for (final s in students) s.id: s.displayName,
                  };
                  final statusCount = {
                    'hadir': 0,
                    'izin': 0,
                    'sakit': 0,
                    'alpha': 0,
                  };

                  return Column(
                    children: [
                      // Summary
                      Card(
                        color: Colors.teal.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Wrap(
                            spacing: 12,
                            children: attendances.map((a) {
                              statusCount[a.status] =
                                  (statusCount[a.status] ?? 0) + 1;
                              return const SizedBox.shrink();
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...attendances.map((a) {
                        final name = studentMap[a.studentId] ?? 'Siswa';
                        return Card(
                          margin: const EdgeInsets.only(bottom: 6),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _statusColor(a.status)
                                  .withValues(alpha: 0.15),
                              child: Text(
                                name.isNotEmpty ? name[0].toUpperCase() : '?',
                                style: TextStyle(
                                  color: _statusColor(a.status),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(name),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _statusColor(a.status)
                                    .withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                _statusLabel(a.status),
                                style: TextStyle(
                                  color: _statusColor(a.status),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Text('Error: $e'),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Jurnal?'),
        content: const Text(
          'Jurnal dan presensi terkait akan dihapus.\n'
          'Data siswa dan nilai tidak terpengaruh.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await ref
                  .read(journalRepositoryProvider)
                  .deleteJournalEntry(journalEntry.id);
              if (ctx.mounted) Navigator.pop(ctx);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'hadir':
        return Colors.green;
      case 'izin':
      case 'sakit':
        return Colors.orange;
      case 'alpha':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _statusLabel(String status) {
    return status[0].toUpperCase() + status.substring(1);
  }

  String _formatDate(DateTime date) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
