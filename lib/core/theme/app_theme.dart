import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import 'app_spacing.dart';

// This file centralizes the application's ThemeData.
// It combines the color, text, and component themes into a single source of truth,
// fully realizing the "Calm Design System".
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    const colors = AppColors.light;
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Noto Sans TC',
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onPrimary, // Assuming white/black text on secondary
        error: colors.error,
        onError: colors.onPrimary, // Assuming white text on error color
        surface: colors.surface,
        onSurface: colors.onSurface,
        outline: colors.outline,
      ),
      scaffoldBackgroundColor: colors.background,
      textTheme: AppTextTheme.light,
      cardTheme: CardThemeData(
        elevation: 1,
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.small,
          horizontal: AppSpacing.medium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.medium),
          side: BorderSide(color: colors.outline),
        ),
        color: colors.surface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colors.primary,
        titleTextStyle: AppTextTheme.light.bodyLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.medium),
        ),
      ),
      // ... other theme properties
    );
  }

  static ThemeData get darkTheme {
    const colors = AppColors.dark;
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Noto Sans TC',
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onPrimary,
        error: colors.error,
        onError: colors.onPrimary,
        surface: colors.surface,
        onSurface: colors.onSurface,
        outline: colors.outline,
      ),
      scaffoldBackgroundColor: colors.background,
      textTheme: AppTextTheme.dark,
      cardTheme: CardThemeData(
        elevation: 1,
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.small,
          horizontal: AppSpacing.medium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.medium),
          side: BorderSide(color: colors.outline),
        ),
        color: colors.surface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colors.primary,
        titleTextStyle: AppTextTheme.dark.bodyLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.medium),
        ),
      ),
      // ... other theme properties
    );
  }
}
