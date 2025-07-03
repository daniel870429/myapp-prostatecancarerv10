import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../presentation/features/psa_tracker/notifiers/psa_tracker_notifier.dart';
import '../../../../presentation/global_widgets/inputs/app_text_field.dart';

class AddPsaLogDialog extends ConsumerStatefulWidget {
  const AddPsaLogDialog({super.key});

  @override
  ConsumerState<AddPsaLogDialog> createState() => _AddPsaLogDialogState();
}

class _AddPsaLogDialogState extends ConsumerState<AddPsaLogDialog> {
  final _formKey = GlobalKey<FormState>();
  final _psaValueController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _psaValueController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final value = double.tryParse(_psaValueController.text);
      if (value != null) {
        ref.read(psaTrackerNotifierProvider.notifier).addPsaLog(
              value: value,
              timestamp: DateTime.now(),
            );
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('新增 PSA 紀錄'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: _psaValueController,
              labelText: 'PSA 數值',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '請輸入 PSA 數值';
                }
                if (double.tryParse(value) == null) {
                  return '請輸入有效的數字';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.medium),
            AppTextField(
              controller: _notesController,
              labelText: '筆記 (選填)',
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('儲存'),
        ),
      ],
    );
  }
}
