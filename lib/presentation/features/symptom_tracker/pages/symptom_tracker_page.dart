import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../global_widgets/dialogs/confirmation_dialog.dart';

import '../notifiers/symptom_tracker_notifier.dart';
import '../widgets/add_symptom_dialog.dart';

class SymptomTrackerPage extends ConsumerWidget {
  const SymptomTrackerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symptomsAsync = ref.watch(symptomTrackerNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('症狀日誌')),
      body: symptomsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('發生錯誤: $err')),
        data: (symptoms) {
          if (symptoms.isEmpty) {
            return const Center(
              child: Text(
                '目前沒有任何症狀紀錄。\n點擊右下角按鈕新增第一筆紀錄。',
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemCount: symptoms.length,
            itemBuilder: (context, index) {
              final log = symptoms[index];
              return ListTile(
                title: Text(log.symptomName),
                subtitle: Text(
                  '嚴重程度: ${log.severity} | ${DateFormat.yMMMd().add_jm().format(log.recordedAt)}',
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (_) => ConfirmationDialog(
                            title: '確認刪除',
                            content: '您確定要刪除「${log.symptomName}」這筆紀錄嗎？此操作無法復原。',
                            onConfirm: () {
                              ref
                                  .read(symptomTrackerNotifierProvider.notifier)
                                  .deleteSymptom(log.id);
                            },
                          ),
                    );
                  },
                ),
                onTap: () {
                  // Optional: Implement edit functionality
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
