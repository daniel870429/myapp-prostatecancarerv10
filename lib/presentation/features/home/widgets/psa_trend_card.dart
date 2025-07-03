import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../psa_tracker/notifiers/psa_tracker_notifier.dart';
import '../../psa_tracker/widgets/add_psa_log_dialog.dart';
import 'dashboard_card.dart';

class PsaTrendCard extends ConsumerWidget {
  const PsaTrendCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final psaLogsAsync = ref.watch(psaTrackerNotifierProvider);
    final colors =
        Theme.of(context).brightness == Brightness.light
            ? AppColors.light
            : AppColors.dark;

    return DashboardCard(
      title: 'PSA 趨勢',
      headerTrailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddPsaLogDialog(),
          );
        },
      ),
      child: SizedBox(
        height: 200,
        child: psaLogsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('無法載入 PSA 資料: $err')),
          data: (logs) {
            if (logs.isEmpty) {
              return const Center(child: Text('尚無 PSA 紀錄'));
            }

            final spots =
                logs.map((log) {
                  return FlSpot(
                    log.recordedAt.millisecondsSinceEpoch.toDouble(),
                    log.value,
                  );
                }).toList();

            return LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: colors.primary,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: colors.primary.withAlpha(51), // ~20% opacity
                    ),
                  ),
                ],
                titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                  bottomTitles: AxisTitles(),
                  topTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                ),
                gridData: FlGridData(
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: colors.outline.withAlpha(128), // ~50% opacity
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: colors.outline),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
