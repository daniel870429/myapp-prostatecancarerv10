// lib/presentation/features/symptom_tracker/widgets/add_symptom_dialog.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/symptom_tracker_notifier.dart';

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
      ref.read(symptomTrackerNotifierProvider.notifier).addSymptom(
            _nameController.text,
            _severity.toInt(),
            _notesController.text,
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
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Symptom Name'),
              validator: (value) =>
                  (value == null || value.isEmpty) ? 'Please enter a name' : null,
            ),
            const SizedBox(height: 16),
            Text('Severity: ${_severity.toInt()}'),
            Slider(
              value: _severity,
              min: 0,
              max: 10,
              divisions: 10,
              label: _severity.round().toString(),
              onChanged: (value) => setState(() => _severity = value),
            ),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes (Optional)'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
