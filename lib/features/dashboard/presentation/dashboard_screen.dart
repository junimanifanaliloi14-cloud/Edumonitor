import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../settings/presentation/settings_screen.dart';
import 'dashboard_providers.dart';

class DashboardScreen extends ConsumerWidget {
  final void Function(int tabIndex)? onNavigateToTab;

  const DashboardScreen({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EduMonitor'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () => ref.invalidate(dashboardStatsProvider),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Pengaturan',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: statsAsync.when(
        data: (stats) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dashboardStatsProvider);
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Ringkasan Data',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ketuk kartu untuk membuka detail',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                  children: [
                    _StatCard(
                      title: 'Siswa',
                      value: stats['students'].toString(),
                      icon: Icons.people,
                      color: Colors.blue,
                      onTap: () => onNavigateToTab?.call(1),
                    ),
                    _StatCard(
                      title: 'Mata Pelajaran',
                      value: stats['subjects'].toString(),
                      icon: Icons.menu_book,
                      color: Colors.orange,
                      onTap: () => onNavigateToTab?.call(2),
                    ),
                    _StatCard(
                      title: 'Materi',
                      value: stats['documents'].toString(),
                      icon: Icons.folder,
                      color: Colors.purple,
                      onTap: () => onNavigateToTab?.call(3),
                    ),
                    _StatCard(
                      title: 'Soal Dibuat',
                      value: stats['questions'].toString(),
                      icon: Icons.quiz,
                      color: Colors.green,
                      onTap: () => onNavigateToTab?.call(2),
                    ),
                    _StatCard(
                      title: 'Asesmen',
                      value: stats['assessments'].toString(),
                      icon: Icons.assignment,
                      color: Colors.red,
                      onTap: () => onNavigateToTab?.call(4),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Card(
                  color: Colors.teal.shade50,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang di EduMonitor!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Mulai dengan menambahkan Siswa, membuat Mata Pelajaran, '
                          'dan mengunggah Materi. Sistem akan membantu Anda membuat '
                          'soal secara otomatis dari materi tersebut.',
                          style: TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
