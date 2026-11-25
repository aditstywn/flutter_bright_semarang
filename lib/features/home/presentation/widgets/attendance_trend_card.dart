import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/dashboard_response_model.dart';

class AttendanceTrendCard extends StatelessWidget {
  final List<TrendKehadiran>? trendData;

  const AttendanceTrendCard({super.key, this.trendData});

  String _shortMonthLabel(TrendKehadiran item) {
    final raw = (item.label ?? item.bulan ?? '').trim();
    if (raw.isEmpty) return '-';
    final firstWord = raw.split(RegExp(r'\s+')).first;
    return firstWord.length > 3 ? firstWord.substring(0, 3) : firstWord;
  }

  @override
  Widget build(BuildContext context) {
    final items = trendData ?? const <TrendKehadiran>[];

    final int highestValue = items.fold<int>(0, (prev, item) {
      final maxItem = math.max(item.tepatWaktu ?? 0, item.terlambat ?? 0);
      return maxItem > prev ? maxItem : prev;
    });

    final double interval = highestValue <= 4
        ? 1
        : (highestValue / 4).ceilToDouble();
    final double maxY = highestValue == 0
        ? 4
        : ((highestValue / interval).ceil() * interval).toDouble();

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
              Icon(Icons.bar_chart_rounded, color: ColorsApp.primary, size: 20),
              SizedBox(width: 8),
              Text(
                'Tren Kehadiran 6 Bulan',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.gray900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          if (items.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'Belum ada data tren kehadiran',
                  style: TextStyle(fontSize: 12.5, color: ColorsApp.gray500),
                ),
              ),
            )
          else
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  maxY: maxY,
                  minY: 0,
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => ColorsApp.gray900,
                      tooltipBorderRadius: BorderRadius.circular(8),
                      tooltipPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        if (groupIndex < 0 || groupIndex >= items.length) {
                          return null;
                        }
                        final item = items[groupIndex];
                        final monthTitle = item.bulan ?? item.label ?? '-';
                        final isOnTime = rodIndex == 0;
                        final label = isOnTime ? 'Tepat Waktu' : 'Terlambat';
                        final value = rod.toY.toInt();
                        return BarTooltipItem(
                          '$monthTitle\n',
                          const TextStyle(
                            color: ColorsApp.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 11.5,
                          ),
                          children: [
                            TextSpan(
                              text: '$label: $value hari',
                              style: TextStyle(
                                color: isOnTime
                                    ? const Color(0xFF4ADE80)
                                    : const Color(0xFFFCA5A5),
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: interval,
                    getDrawingHorizontalLine: (value) =>
                        const FlLine(color: ColorsApp.gray200, strokeWidth: 1),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: ColorsApp.gray200, width: 1),
                      bottom: BorderSide(color: ColorsApp.gray200, width: 1),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: interval,
                        getTitlesWidget: (value, meta) {
                          if (value % 1 != 0) return const SizedBox.shrink();
                          return Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Text(
                              '${value.toInt()}',
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.gray400,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= items.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              _shortMonthLabel(items[index]),
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.gray500,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(items.length, (index) {
                    final item = items[index];
                    return BarChartGroupData(
                      x: index,
                      barsSpace: 4,
                      barRods: [
                        BarChartRodData(
                          toY: (item.tepatWaktu ?? 0).toDouble(),
                          color: const Color(0xFF16A34A),
                          width: 10,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: maxY,
                            color: ColorsApp.gray100,
                          ),
                        ),
                        BarChartRodData(
                          toY: (item.terlambat ?? 0).toDouble(),
                          color: ColorsApp.primary,
                          width: 10,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: maxY,
                            color: ColorsApp.gray100,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          const SizedBox(height: 14),

          // Legend
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendDot(color: Color(0xFF16A34A), label: 'Tepat Waktu'),
              SizedBox(width: 20),
              _LegendDot(color: ColorsApp.primary, label: 'Terlambat'),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ColorsApp.gray600,
          ),
        ),
      ],
    );
  }
}
