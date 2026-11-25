import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/dashboard_response_model.dart';

class MonthlyStatsCard extends StatelessWidget {
  final StatistikBulanan? stats;

  const MonthlyStatsCard({super.key, this.stats});

  @override
  Widget build(BuildContext context) {
    final bool needsImprovement = (stats?.persentaseKehadiran ?? 0) < 75.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsApp.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.pie_chart_outline_rounded,
                color: ColorsApp.primary,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Statistik & Kehadiran Bulan Ini',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.gray900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              SizedBox(
                width: 92,
                height: 92,
                child: CustomPaint(
                  painter: _AttendanceRingPainter(
                    progress: ((stats?.persentaseKehadiran ?? 0) / 100).clamp(
                      0.0,
                      1.0,
                    ),
                    activeColor: needsImprovement
                        ? ColorsApp.primary
                        : const Color(0xFF16A34A),
                    trackColor: ColorsApp.gray200,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${(stats?.persentaseKehadiran ?? 0).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: ColorsApp.gray900,
                          ),
                        ),
                        const Text(
                          'Kehadiran',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: ColorsApp.gray500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${stats?.totalKehadiran ?? 0} hadir dari ${stats?.hariKerjaBerjalan} hari kerja',
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.gray900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Total hari kerja bulan ini: ${stats?.totalHariKerjaBulanIni ?? 0} hari',
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: ColorsApp.gray500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: needsImprovement
                            ? const Color(0xFFFEF2F2)
                            : const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: needsImprovement
                              ? ColorsApp.primary.withAlpha(60)
                              : const Color(0xFFBBF7D0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            needsImprovement
                                ? Icons.trending_up_rounded
                                : Icons.verified_rounded,
                            size: 13,
                            color: needsImprovement
                                ? ColorsApp.primary
                                : const Color(0xFF15803D),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            needsImprovement
                                ? 'Perlu ditingkatkan'
                                : 'Kehadiran sangat baik',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: needsImprovement
                                  ? ColorsApp.primary
                                  : const Color(0xFF15803D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _StatPillBox(
                  label: 'Total Hadir',
                  count: stats?.totalKehadiran ?? 0,
                  dotColor: const Color(0xFF16A34A),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatPillBox(
                  label: 'Terlambat',
                  count: stats?.terlambat ?? 0,
                  dotColor: ColorsApp.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _StatPillBox(
                  label: 'Izin',
                  count: stats?.izin ?? 0,
                  dotColor: ColorsApp.warning,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatPillBox(
                  label: 'Sakit',
                  count: stats?.sakit ?? 0,
                  dotColor: ColorsApp.gray400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatPillBox extends StatelessWidget {
  final String label;
  final int count;
  final Color dotColor;

  const _StatPillBox({
    required this.label,
    required this.count,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsApp.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.gray600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '$count hari',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: ColorsApp.gray900,
            ),
          ),
        ],
      ),
    );
  }
}

class _AttendanceRingPainter extends CustomPainter {
  final double progress;
  final Color activeColor;
  final Color trackColor;

  _AttendanceRingPainter({
    required this.progress,
    required this.activeColor,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 9.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    final sweepAngle = 2 * math.pi * progress;
    if (sweepAngle > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweepAngle,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _AttendanceRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.trackColor != trackColor;
  }
}
