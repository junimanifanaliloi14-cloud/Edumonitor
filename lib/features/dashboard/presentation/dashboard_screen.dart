import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/reporting/reporting_models.dart';
import '../../reporting/presentation/reporting_providers.dart';
import '../../settings/presentation/settings_screen.dart';
import 'dashboard_providers.dart';

class DashboardScreen extends ConsumerWidget {
  final void Function(int tabIndex)? onNavigateToTab;

  const DashboardScreen({super.key, this.onNavigateToTab});

  /// Mapping tab index (6 tab total):
  /// 0=Beranda, 1=Kelas, 2=Siswa, 3=Kurikulum, 4=Materi, 5=Asesmen
  static const int _tabSiswa = 2;
  static const int _tabKurikulum = 3;
  static const int _tabMateri = 4;
  static const int _tabAsesmen = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardStatsProvider);
    final metricsAsync = ref.watch(reportingMetricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EduMonitor'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              ref.invalidate(dashboardStatsProvider);
              ref.invalidate(reportingMetricsProvider);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Pengaturan',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardStatsProvider);
          ref.invalidate(reportingMetricsProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Ringkasan Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            const Text(
              'Ketuk kartu untuk membuka detail',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            statsAsync.when(
              data: (stats) => _CompactStatsGrid(
                stats: stats,
                onNavigateToTab: onNavigateToTab,
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
            ),
            const SizedBox(height: 20),
            metricsAsync.when(
              data: (metrics) => _ReportingSection(metrics: metrics),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// COMPACT STATS GRID — 5 kartu kecil dalam 1 baris horizontal
// (dapat di-scroll horizontal jika layar sempit)
// ==========================================

class _CompactStatsGrid extends StatelessWidget {
  final Map<String, int> stats;
  final void Function(int)? onNavigateToTab;
  const _CompactStatsGrid({required this.stats, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    final items = [
      _CompactStatItem(
        title: 'Siswa',
        value: stats['students'] ?? 0,
        icon: Icons.people,
        color: Colors.blue,
        onTap: () => onNavigateToTab?.call(DashboardScreen._tabSiswa),
      ),
      _CompactStatItem(
        title: 'Mapel',
        value: stats['subjects'] ?? 0,
        icon: Icons.menu_book,
        color: Colors.orange,
        onTap: () => onNavigateToTab?.call(DashboardScreen._tabKurikulum),
      ),
      _CompactStatItem(
        title: 'Materi',
        value: stats['documents'] ?? 0,
        icon: Icons.folder,
        color: Colors.purple,
        onTap: () => onNavigateToTab?.call(DashboardScreen._tabMateri),
      ),
      _CompactStatItem(
        title: 'Soal',
        value: stats['questions'] ?? 0,
        icon: Icons.quiz,
        color: Colors.green,
        onTap: () => onNavigateToTab?.call(DashboardScreen._tabKurikulum),
      ),
      _CompactStatItem(
        title: 'Asesmen',
        value: stats['assessments'] ?? 0,
        icon: Icons.assignment,
        color: Colors.red,
        onTap: () => onNavigateToTab?.call(DashboardScreen._tabAsesmen),
      ),
    ];

    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 110,
            child: _CompactStatCard(item: items[index]),
          );
        },
      ),
    );
  }
}

class _CompactStatItem {
  final String title;
  final int value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  const _CompactStatItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
  });
}

class _CompactStatCard extends StatelessWidget {
  final _CompactStatItem item;
  const _CompactStatCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: item.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 22, color: item.color),
              const SizedBox(height: 4),
              Text(
                '${item.value}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: item.color,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.title,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// REPORTING SECTION (KPI + Chart + Attention)
// ==========================================

class _ReportingSection extends StatelessWidget {
  final ReportingMetrics metrics;
  const _ReportingSection({required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (metrics.pendingQuestions > 0) ...[
          Card(
            color: Colors.orange.shade50,
            child: ListTile(
              leading: const Icon(Icons.pending_actions, color: Colors.orange),
              title: Text(
                '${metrics.pendingQuestions} soal menunggu review',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Kurikulum → Topik → Bank Soal → Verifikasi',
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        const Text(
          'Performa Kelas',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _KpiCard(
                label: 'Rata-rata',
                value: metrics.classAverage.toStringAsFixed(1),
                icon: Icons.analytics,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _KpiCard(
                label: 'Tertinggi',
                value: metrics.highestScore.toStringAsFixed(1),
                icon: Icons.trending_up,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _KpiCard(
                label: 'Terendah',
                value: metrics.lowestScore.toStringAsFixed(1),
                icon: Icons.trending_down,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        if (metrics.scoreTrend.isNotEmpty) ...[
          const Text(
            'Tren Nilai',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          const Text(
            'Rata-rata per asesmen (10 terakhir)',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          _TrendChart(points: metrics.scoreTrend),
          const SizedBox(height: 20),
        ],
        if (metrics.studentsNeedingAttention.isNotEmpty) ...[
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.orange),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Siswa Perlu Perhatian (${metrics.studentsNeedingAttention.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text(
            'Rata-rata di bawah 70 — pertimbangkan remedial',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          ...metrics.studentsNeedingAttention.map(
            (s) => Card(
              margin: const EdgeInsets.only(bottom: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade50,
                  child: Text(
                    s.studentName.isNotEmpty
                        ? s.studentName[0].toUpperCase()
                        : '?',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(s.studentName),
                subtitle: Text('${s.attemptCount} asesmen'),
                trailing: Text(
                  s.averageScore.toStringAsFixed(1),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ] else if (metrics.scoreTrend.isNotEmpty) ...[
          Card(
            color: Colors.green.shade50,
            child: const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text(
                'Semua siswa di atas KKM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Tidak ada yang perlu remedial saat ini'),
            ),
          ),
        ] else ...[
          Card(
            color: Colors.blue.shade50,
            child: const ListTile(
              leading: Icon(Icons.info_outline, color: Colors.blue),
              title: Text('Belum ada data nilai'),
              subtitle: Text(
                'Catat nilai siswa di tab Asesmen untuk melihat grafik tren',
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  const _KpiCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TrendChart extends StatelessWidget {
  final List<ScoreTrendPoint> points;
  const _TrendChart({required this.points});

  @override
  Widget build(BuildContext context) {
    final spots = points
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.averageScore))
        .toList();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
        child: SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: 100,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 20,
                getDrawingHorizontalLine: (value) =>
                    FlLine(color: Colors.grey.shade300, strokeWidth: 1),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 20,
                    reservedSize: 32,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final i = value.toInt();
                      if (i < 0 || i >= points.length) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: Colors.teal,
                  barWidth: 3,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.teal.withValues(alpha: 0.15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
