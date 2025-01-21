import 'package:flutter/material.dart';

class TextThemes {
  static TextTheme textTheme(BuildContext context) {
    final theme = Theme.of(context);
    return TextTheme(
      // region Titles
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        fontSize: 100,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: theme.textTheme.titleMedium?.copyWith(
        fontSize: 64,
        fontWeight: FontWeight.w600,
      ),
      // endregion
      // region Body
      bodyLarge: theme.textTheme.bodyLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      // endregion
      // region Labels
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: theme.textTheme.labelMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: theme.textTheme.labelSmall?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      // endregion
    );
  }
}
