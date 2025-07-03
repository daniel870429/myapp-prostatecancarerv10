import 'package:flutter/material.dart';
import '../buttons/primary_action_button.dart';

/// A generic dialog for confirming a destructive action.
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmButtonText;
  final VoidCallback onConfirm;

  const ConfirmationDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmButtonText = '確認刪除',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: const Text('取消'),
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
        ),
        PrimaryActionButton(
          backgroundColor: Theme.of(context).colorScheme.error,
          label: confirmButtonText,
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop(); // Dismiss the dialog
          },
        ),
      ],
    );
  }
}
