// lib/presentation/features/symptom_tracker/widgets/add_symptom_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../global_widgets/buttons/primary_action_button.dart';
import '../../../global_widgets/inputs/app_text_field.dart';
import '../notifiers/symptom_tracker_notifier.dart';
import 'gradient_slider_track_shape.dart';

class AddSymptomDialog extends ConsumerStatefulWidget {
  const AddSymptomDialog({super.key});

  @override
  ConsumerState<AddSymptomDialog> createState() => _AddSymptomDialogState();
}

class _AddSymptomDialogState extends ConsumerState<AddSymptomDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  double _severity = 5.0;

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(symptomTrackerNotifierProvider.notifier).addSymptomLog(
            name: _nameController.text,
            severity: _severity.toInt(),
            timestamp: DateTime.now(),
            comments: _notesController.text,
          );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Symptom'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: _nameController,
              labelText: 'Symptom Name',
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter a name'
                  : null,
            ),
            const SizedBox(height: AppSpacing.medium),
            Text(
              'Severity: ${_severity.toInt()}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SliderTheme(
              data: SliderTheme.of(
                context,
              ).copyWith(trackShape: const GradientSliderTrackShape()),
              child: Slider(
                value: _severity,
                max: 10,
                divisions: 10,
                label: _severity.round().toString(),
                onChanged: (value) => setState(() => _severity = value),
              ),
            ),
            AppTextField(
              controller: _notesController,
              labelText: 'Notes (Optional)',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        PrimaryActionButton(onPressed: _submit, label: 'Add'),
      ],
    );
  }
}
