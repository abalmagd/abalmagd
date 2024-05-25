import 'package:flutter/material.dart';

class TextThemes {
  static TextTheme textTheme(BuildContext context) {
    final theme = Theme.of(context);
    return TextTheme(
      // region Headlines
      // All headlines
      headlineLarge: theme.textTheme.headlineLarge?.copyWith(
        fontFamily: 'Raleway',
        fontSize: 44,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: theme.textTheme.headlineMedium?.copyWith(
        fontFamily: 'Raleway',
        fontSize: 34,
        fontWeight: FontWeight.w800,
      ),
      headlineSmall: theme.textTheme.headlineSmall?.copyWith(
        fontFamily: 'Raleway',
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      // endregion
      // region Body
      // All body text
      bodyMedium: theme.textTheme.bodyMedium?.copyWith(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: theme.textTheme.bodySmall?.copyWith(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      // endregion
      // region Labels
      // Testimonial client names
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        fontFamily: 'Raleway',
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      // App bar buttons
      labelMedium: theme.textTheme.labelMedium?.copyWith(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      // All buttons & text field titles
      labelSmall: theme.textTheme.labelSmall?.copyWith(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      // endregion
    );
  }
}
