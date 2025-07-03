import 'package:flutter/material.dart';

// As per the design specification, this file centralizes all text styles
// for the application. Developers MUST use these styles via Theme.of(context).textTheme
// to ensure global consistency and accessibility.
// Hard-coding TextStyles is strictly forbidden.
class AppTextTheme {
  AppTextTheme._();

  static const String _fontFamily = 'Noto Sans TC';

  static final TextTheme light = ThemeData.light().textTheme.copyWith(
    displayLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 57,
    ),
    displayMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 45,
    ),
    displaySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headlineLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    headlineMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    headlineSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    titleMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      letterSpacing: 0.15,
    ),
    titleSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    bodyLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    bodyMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.25,
    ),
    bodySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.5,
      letterSpacing: 0.4,
    ),
    labelLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    labelMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
    labelSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 11,
      letterSpacing: 0.5,
    ),
  );

  static final TextTheme dark = ThemeData.dark().textTheme.copyWith(
    displayLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 57,
    ),
    displayMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 45,
    ),
    displaySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    headlineLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    headlineMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
    headlineSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    titleMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      letterSpacing: 0.15,
    ),
    titleSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    bodyLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
    ),
    bodyMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.25,
    ),
    bodySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 1.5,
      letterSpacing: 0.4,
    ),
    labelLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    labelMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
    labelSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 11,
      letterSpacing: 0.5,
    ),
  );
}
