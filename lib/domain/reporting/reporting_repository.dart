import 'reporting_models.dart';

abstract interface class ReportingRepository {
  /// Mengembalikan semua metrik dashboard.
  /// [attentionThreshold] default 70.0 — siswa dengan rata-rata di bawah
  /// nilai ini masuk daftar "perlu perhatian".
  Future<ReportingMetrics> getMetrics({double attentionThreshold = 70.0});
}
