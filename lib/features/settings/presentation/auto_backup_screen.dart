import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_snackbar.dart';
import '../../../domain/backup/backup_service.dart';
import 'settings_providers.dart';

class AutoBackupScreen extends ConsumerStatefulWidget {
  const AutoBackupScreen({super.key});

  @override
  ConsumerState<AutoBackupScreen> createState() => _AutoBackupScreenState();
}

class _AutoBackupScreenState extends ConsumerState<AutoBackupScreen> {
  bool _loading = true;
  bool _enabled = true;
  DateTime? _lastAt;
  List<AutoBackupInfo> _backups = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final svc = ref.read(backupServiceProvider);
      final enabled = await svc.isAutoBackupEnabled();
      final lastAt = await svc.getLastAutoBackupAt();
      final backups = await svc.listAutoBackups();
      if (mounted) {
        setState(() {
          _enabled = enabled;
          _lastAt = lastAt;
          _backups = backups;
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _loading = false);
        AppSnackbar.error(context, 'Gagal memuat: $e');
      }
    }
  }

  Future<void> _toggleEnabled(bool value) async {
    try {
      await ref.read(backupServiceProvider).setAutoBackupEnabled(value);
      if (mounted) setState(() => _enabled = value);
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal: $e');
    }
  }

  Future<void> _runBackupNow() async {
    setState(() => _loading = true);
    try {
      // Force: ubah last_at ke masa lalu agar trigger
      final svc = ref.read(backupServiceProvider);
      final result = await svc.runAutoBackupIfDue();
      if (result == null) {
        if (mounted) {
          AppSnackbar.info(
            context,
            'Backup belum jatuh tempo. Matikan-lalu-aktifkan toggle untuk reset, '
            'atau tunggu 24 jam berikutnya.',
          );
        }
      } else if (mounted) {
        AppSnackbar.success(context, 'Backup dibuat: ${result.filePath}');
      }
      await _load();
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal: $e');
    }
  }

  Future<void> _restoreFromBackup(AutoBackupInfo info) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restore dari Backup Ini?'),
        content: Text(
          'Backup dari ${_formatDate(info.createdAt)}.\n\n'
          'Semua data saat ini akan DIGANTI. Aplikasi harus ditutup setelahnya.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restore', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _loading = true);
    try {
      await ref.read(backupServiceProvider).importBackup(info.filePath);
      if (mounted) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: const Text('Restore Berhasil'),
            content: const Text('Aplikasi akan ditutup. Buka kembali.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  if (kIsWeb) return;
                  if (Platform.isWindows ||
                      Platform.isLinux ||
                      Platform.isMacOS) {
                    exit(0);
                  } else {
                    SystemNavigator.pop();
                  }
                },
                child: const Text('Tutup Aplikasi'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal restore: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _formatDate(DateTime dt) {
    final d = dt.day.toString().padLeft(2, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final h = dt.hour.toString().padLeft(2, '0');
    final mi = dt.minute.toString().padLeft(2, '0');
    return '$d/$m/${dt.year} $h:$mi';
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup Otomatis'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loading ? null : _load,
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  color: Colors.teal.shade50,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Backup Otomatis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Aplikasi otomatis membuat backup setiap 24 jam '
                          'saat dibuka. Maksimal 5 backup terbaru disimpan. '
                          'Backup disimpan di folder aplikasi (aman, tidak '
                          'bisa diakses aplikasi lain).',
                          style: TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text(
                    'Aktifkan Backup Otomatis',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _lastAt == null
                        ? 'Belum pernah backup otomatis'
                        : 'Terakhir: ${_formatDate(_lastAt!)}',
                  ),
                  value: _enabled,
                  activeThumbColor: Colors.teal,
                  onChanged: _toggleEnabled,
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.backup,
                      color: Colors.teal,
                      size: 32,
                    ),
                    title: const Text('Backup Sekarang'),
                    subtitle: const Text('Membuat backup + reset timer 24 jam'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: _runBackupNow,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Riwayat Backup (${_backups.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                if (_backups.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          'Belum ada backup otomatis',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  )
                else
                  ..._backups.map(
                    (b) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const Icon(Icons.archive, color: Colors.blue),
                        title: Text(_formatDate(b.createdAt)),
                        subtitle: Text(_formatSize(b.sizeBytes)),
                        trailing: IconButton(
                          icon: const Icon(Icons.restore, color: Colors.teal),
                          tooltip: 'Restore',
                          onPressed: () => _restoreFromBackup(b),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
