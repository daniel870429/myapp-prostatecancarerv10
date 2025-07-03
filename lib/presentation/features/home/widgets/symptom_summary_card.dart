import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../symptom_tracker/notifiers/symptom_tracker_notifier.dart';
import 'dashboard_card.dart';

/// A dashboard card that shows a summary of the user's symptom logs.
class SymptomSummaryCard extends ConsumerWidget {
  const SymptomSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symptomsAsync = ref.watch(symptomTrackerNotifierProvider);

    return DashboardCard(
      title: '症狀總覽',
      child: symptomsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('無法載入資料: $err'),
        data: (symptoms) {
          return Text(
            '您目前共記錄了 ${symptoms.length} 筆症狀。',
            style: Theme.of(context).textTheme.bodyLarge,
          );
        },
      ),
    );
  }
}
