import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../notifiers/symptom_tracker_notifier.dart';
import '../widgets/add_symptom_dialog.dart';
import '../../../global_widgets/dialogs/confirmation_dialog.dart';

class SymptomTrackerPage extends ConsumerWidget {
  const SymptomTrackerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symptomsAsync = ref.watch(symptomTrackerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddSymptomDialog(context),
          ),
        ],
      ),
      body: symptomsAsync.when(
        data: (symptoms) => ListView.builder(
          itemCount: symptoms.length,
          itemBuilder: (context, index) {
            final log = symptoms[index];
            return ListTile(
              title: Text(log.name),
              subtitle: Text(
                'Severity: ${log.severity} | ${DateFormat.yMMMd().add_jm().format(log.timestamp)}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => ConfirmationDialog(
                      title: 'Delete Symptom Log',
                      content:
                          'Are you sure you want to delete this log for "${log.name}"?',
                      onConfirm: () => Navigator.of(context).pop(true),
                    ),
                  );
                  if (confirmed == true) {
                    ref
                        .read(symptomTrackerNotifierProvider.notifier)
                        .deleteSymptomLog(log.id);
                  }
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  void _showAddSymptomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddSymptomDialog();
      },
    );
  }
}
