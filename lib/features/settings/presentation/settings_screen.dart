import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_snackbar.dart';
import '../../export/presentation/export_providers.dart';
import '../../sync/presentation/sync_screen.dart';
import 'settings_providers.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _loading = false;

  Future<void> _handleBackup() async {
    setState(() => _loading = true);
    try {
      final path = await ref.read(backupServiceProvider).exportBackup();
      if (path != null && mounted) {
        AppSnackbar.success(context, 'Backup tersimpan di: $path');
      }
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal backup: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _handleExportCsv() async {
    setState(() => _loading = true);
    try {
      final result = await ref
          .read(exportServiceProvider)
          .exportAllScoresToCsv();
      if (result != null && mounted) {
        AppSnackbar.success(
          context,
          'Nilai CSV tersimpan di: ${result.filePath}',
        );
      }
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal ekspor CSV: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _handleExportClassPdf() async {
    setState(() => _loading = true);
    try {
      final result = await ref
          .read(exportServiceProvider)
          .exportClassReportToPdf();
      if (result != null && mounted) {
        AppSnackbar.success(
          context,
          'Laporan PDF tersimpan di: ${result.filePath}',
        );
      }
    } catch (e) {
      if (mounted) AppSnackbar.error(context, 'Gagal ekspor PDF: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _handleRestore() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restore Data?'),
        content: const Text(
          'Semua data saat ini akan DIGANTI dengan isi backup. '
          'Aplikasi harus ditutup setelah restore.\n\nLanjutkan?',
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
              'Ya, Restore',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _loading = true);
    try {
      final result = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['zip'],
      );

      if (result == null || result.path == null) {
        if (mounted) setState(() => _loading = false);
        return;
      }

      await ref.read(backupServiceProvider).importBackup(result.path!);

      if (mounted) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: const Text('Restore Berhasil'),
            content: const Text(
              'Aplikasi akan ditutup. Silakan buka kembali untuk melihat '
              'data yang dipulihkan.',
            ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Laporan & Ekspor',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Ekspor nilai siswa untuk arsip sekolah.'),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.table_chart,
                color: Colors.green,
                size: 32,
              ),
              title: const Text('Ekspor Nilai CSV'),
              subtitle: const Text('Semua nilai siswa dalam satu file'),
              trailing: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              onTap: _loading ? null : _handleExportCsv,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
                size: 32,
              ),
              title: const Text('Ekspor Laporan Kelas PDF'),
              subtitle: const Text('Matriks nilai semua siswa × semua asesmen'),
              trailing: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              onTap: _loading ? null : _handleExportClassPdf,
            ),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Backup & Restore',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Simpan salinan data secara berkala ke lokasi aman.'),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.backup, color: Colors.teal, size: 32),
              title: const Text('Backup Data'),
              subtitle: const Text('Simpan database ke file .zip'),
              trailing: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              onTap: _loading ? null : _handleBackup,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.restore,
                color: Colors.orange,
                size: 32,
              ),
              title: const Text('Restore Data'),
              subtitle: const Text('Pulihkan database dari file .zip'),
              trailing: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              onTap: _loading ? null : _handleRestore,
            ),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            'Sinkronisasi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sinkronkan data antara PC dan Tablet lewat Wi-Fi/LAN lokal.',
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.sync, color: Colors.blue, size: 32),
              title: const Text('Sinkronisasi Wi-Fi/LAN'),
              subtitle: const Text('Pairing via QR Code antar perangkat'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SyncScreen()),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('EduMonitor'),
            subtitle: Text(
              'Versi 1.1.0 (MVP + Reporting + Question Editing)\n'
              'Offline-first learning & student progress monitoring.',
            ),
          ),
        ],
      ),
    );
  }
}
