import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/database/app_database.dart';
import '../../classrooms/presentation/classroom_providers.dart';
import '../../classrooms/presentation/learning_objective_providers.dart';
import 'journal_providers.dart';

class JournalFormScreen extends ConsumerStatefulWidget {
  final Classroom classroom;
  final JournalEntry? existingEntry;

  const JournalFormScreen({
    super.key,
    required this.classroom,
    this.existingEntry,
  });

  @override
  ConsumerState<JournalFormScreen> createState() => _JournalFormScreenState();
}

class _JournalFormScreenState extends ConsumerState<JournalFormScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _activityController;
  late final TextEditingController _notesController;
  late DateTime _selectedDate;
  String? _selectedLoId;
  final Map<String, String> _attendanceStatus = {};
  bool _loading = true;
  bool _saving = false;

  bool get _isEdit => widget.existingEntry != null;

  @override
  void initState() {
    super.initState();
    final existing = widget.existingEntry;
    _selectedDate = existing?.date ?? DateTime.now();
    _titleController = TextEditingController(text: existing?.title ?? '');
    _activityController = TextEditingController(text: existing?.activity ?? '');
    _notesController = TextEditingController(text: existing?.notes ?? '');
    _selectedLoId = existing?.learningObjectiveId;

    WidgetsBinding.instance.addPostFrameCallback((_) => _loadInitialData());
  }

  Future<void> _loadInitialData() async {
    try {
      final students = await ref.read(
        classroomStudentsProvider(widget.classroom.id).future,
      );

      final existing = widget.existingEntry;
      if (existing != null) {
        final attendances = await ref.read(
          journalAttendancesProvider(existing.id).future,
        );
        for (final a in attendances) {
          _attendanceStatus[a.studentId] = a.status;
        }
      }

      for (final s in students) {
        _attendanceStatus.putIfAbsent(s.id, () => 'hadir');
      }

      if (mounted) setState(() => _loading = false);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal memuat data: $e')));
        setState(() => _loading = false);
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _activityController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _save() async {
    if (_activityController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kegiatan tidak boleh kosong')),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      if (_isEdit) {
        await ref
            .read(journalRepositoryProvider)
            .updateJournalEntry(
              id: widget.existingEntry!.id,
              learningObjectiveId: _selectedLoId,
              date: _selectedDate,
              title: _titleController.text.trim().isEmpty
                  ? null
                  : _titleController.text.trim(),
              activity: _activityController.text.trim(),
              notes: _notesController.text.trim().isEmpty
                  ? null
                  : _notesController.text.trim(),
              attendances: _attendanceStatus,
            );
      } else {
        await ref
            .read(journalRepositoryProvider)
            .createJournalEntry(
              classroomId: widget.classroom.id,
              learningObjectiveId: _selectedLoId,
              date: _selectedDate,
              title: _titleController.text.trim().isEmpty
                  ? null
                  : _titleController.text.trim(),
              activity: _activityController.text.trim(),
              notes: _notesController.text.trim().isEmpty
                  ? null
                  : _notesController.text.trim(),
              attendances: _attendanceStatus,
            );
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEdit ? 'Jurnal berhasil diperbarui' : 'Jurnal berhasil dibuat',
            ),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Gagal menyimpan: $e')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_isEdit ? 'Edit Jurnal' : 'Tambah Jurnal'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final losAsync = ref.watch(
      learningObjectiveListProvider(widget.classroom.id),
    );
    final studentsAsync = ref.watch(
      classroomStudentsProvider(widget.classroom.id),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Jurnal' : 'Tambah Jurnal'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Tanggal
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.teal),
              title: const Text('Tanggal Pertemuan'),
              subtitle: Text(_formatDate(_selectedDate)),
              trailing: const Icon(Icons.chevron_right),
              onTap: _pickDate,
            ),
          ),
          const SizedBox(height: 12),

          // TP
          losAsync.when(
            data: (los) {
              if (los.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Belum ada Tujuan Pembelajaran. Tambahkan TP di tab TP untuk mengaitkan jurnal.',
                    style: TextStyle(fontSize: 12),
                  ),
                );
              }
              return DropdownButtonFormField<String>(
                initialValue: _selectedLoId,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Tujuan Pembelajaran (Opsional)',
                  border: OutlineInputBorder(),
                ),
                items: los
                    .map(
                      (lo) => DropdownMenuItem(
                        value: lo.id,
                        child: Text(
                          '${lo.code} - ${lo.description}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _selectedLoId = v),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 12),

          // Judul
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Judul (opsional)',
              hintText: 'Contoh: Pertemuan 5',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // Kegiatan
          TextField(
            controller: _activityController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Kegiatan Pembelajaran *',
              hintText: 'Contoh: Membahas operasi bilangan bulat',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // Catatan
          TextField(
            controller: _notesController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Catatan (opsional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),

          // Presensi
          const Text(
            'Presensi Siswa',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          studentsAsync.when(
            data: (students) {
              if (students.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Belum ada siswa di kelas ini.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              }
              return Column(
                children: students.map((s) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.teal.shade100,
                            child: Text(
                              s.displayName.isNotEmpty
                                  ? s.displayName[0].toUpperCase()
                                  : '?',
                              style: const TextStyle(
                                color: Colors.teal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: Text(s.displayName)),
                          _buildStatusDropdown(s.id),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
          ),
          const SizedBox(height: 24),

          // Save
          ElevatedButton.icon(
            onPressed: _saving ? null : _save,
            icon: _saving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.save),
            label: Text(_isEdit ? 'Simpan Perubahan' : 'Simpan Jurnal'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDropdown(String studentId) {
    final status = _attendanceStatus[studentId] ?? 'hadir';
    final color = _statusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: DropdownButton<String>(
        value: status,
        underline: const SizedBox.shrink(),
        isDense: true,
        style: TextStyle(color: color, fontSize: 13),
        items: const [
          DropdownMenuItem(value: 'hadir', child: Text('Hadir')),
          DropdownMenuItem(value: 'izin', child: Text('Izin')),
          DropdownMenuItem(value: 'sakit', child: Text('Sakit')),
          DropdownMenuItem(value: 'alpha', child: Text('Alpha')),
        ],
        onChanged: (v) {
          if (v != null) {
            setState(() => _attendanceStatus[studentId] = v);
          }
        },
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
