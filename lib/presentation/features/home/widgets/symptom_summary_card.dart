import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dashboard_card.dart';
import '../../symptom_tracker/notifiers/symptom_tracker_notifier.dart';

class SymptomSummaryCard extends ConsumerWidget {
  const SymptomSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symptomState = ref.watch(symptomTrackerNotifierProvider);

    return DashboardCard(
      title: 'Symptom Summary',
      child: symptomState.when(
        data: (symptoms) {
          if (symptoms.isEmpty) {
            return const Text('No recent symptom data.');
          }
          // Simple summary: show the latest symptom entry
          final latestSymptom = symptoms.first;
          return Text(
            'Latest entry: ${latestSymptom.name} at severity ${latestSymptom.severity}',
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('Error: $error'),
      ),
    );
  }
}
