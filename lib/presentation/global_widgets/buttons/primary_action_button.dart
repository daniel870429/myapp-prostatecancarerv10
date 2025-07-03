import 'package:flutter/material.dart';
import '../../../core/theme/app_spacing.dart';

/// The primary call-to-action button for the application, as specified in the
/// Integrated Interface Design Specification v1.0, Section 2.1.
///
/// This component MUST be used for all primary actions to ensure consistency.
/// It uses the "Clinical Trust Blue" color and includes a loading state
/// to provide standardized feedback for asynchronous operations (e.g., saving data to Firebase).
class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.backgroundColor,
    super.key,
  });

  /// The callback that is called when the button is tapped. If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The text to display on the button.
  final String label;

  /// Whether the button is in a loading state. When true, a progress indicator is shown
  /// and the button is disabled.
  final bool isLoading;

  /// An optional background color to override the default primary color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? themeColors.primary,
        foregroundColor: themeColors.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.large,
          vertical: AppSpacing.medium,
        ),
        textStyle: theme.textTheme.labelLarge,
      ),
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
              : Text(label),
    );
  }
}
