// lib/presentation/features/symptom_tracker/pages/symptom_tracker_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../notifiers/symptom_tracker_notifier.dart';
import '../widgets/add_symptom_dialog.dart';

class SymptomTrackerPage extends ConsumerWidget {
  const SymptomTrackerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symptomLogsAsync = ref.watch(symptomTrackerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Tracker'),
      ),
      body: symptomLogsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (logs) {
          if (logs.isEmpty) {
            return const Center(
              child: Text('No symptoms logged yet.'),
            );
          }
          return ListView.builder(
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return ListTile(
                title: Text(log.symptomName),
                subtitle: Text('Severity: ${log.severity}'),
                trailing: Text(DateFormat.yMd().add_jm().format(log.recordedAt)),
                onLongPress: () {
                  // Simple deletion confirmation
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Symptom?'),
                      content: const Text('Are you sure you want to delete this log?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(symptomTrackerNotifierProvider.notifier).deleteSymptom(log.id);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddSymptomDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
