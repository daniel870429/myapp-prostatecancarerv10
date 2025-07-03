import 'dart:async';
import 'package:flutter/material.dart';

/// A confirmation dialog that enforces a delay before the confirmation button
/// is enabled. This is a safety feature to prevent accidental clicks on
/// destructive actions, as per the design guidelines.
class DelayedConfirmationDialog extends StatefulWidget {
  final String title;
  final String content;
  final String confirmText;
  final Duration delay;

  const DelayedConfirmationDialog({
    required this.title,
    required this.content,
    super.key,
    this.confirmText = '確認',
    this.delay = const Duration(seconds: 2),
  });

  @override
  State<DelayedConfirmationDialog> createState() =>
      _DelayedConfirmationDialogState();
}

class _DelayedConfirmationDialogState extends State<DelayedConfirmationDialog> {
  bool _isConfirmButtonEnabled = false;
  late Timer _timer;
  int _countdown = 0;

  @override
  void initState() {
    super.initState();
    _countdown = widget.delay.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _isConfirmButtonEnabled = true;
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorColor = theme.colorScheme.error;

    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('取消'),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: ValueNotifier(_isConfirmButtonEnabled),
          builder: (context, isEnabled, child) {
            return TextButton(
              onPressed:
                  isEnabled ? () => Navigator.of(context).pop(true) : null,
              child: Text(
                isEnabled
                    ? widget.confirmText
                    : '${widget.confirmText} ($_countdown)',
                style: TextStyle(
                  color: isEnabled ? errorColor : theme.disabledColor,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
