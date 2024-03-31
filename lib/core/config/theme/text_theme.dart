import 'package:flutter/material.dart';
import 'package:portfolio/core/config/responsive.dart';

class TextThemes {
  static TextTheme textTheme(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);
    return TextTheme(
      // region Headlines. Uses Plus Jakarta Sans font.
      /// Profile name
      headlineLarge: theme.textTheme.headlineLarge?.copyWith(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 44,
        fontWeight: FontWeight.w800,
      ),

      /// Bold section headlines
      headlineMedium: theme.textTheme.headlineMedium?.copyWith(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),

      /// Item/Card headlines
      headlineSmall: theme.textTheme.headlineSmall?.copyWith(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      // endregion
      // region Body. Used for description texts. Uses Inter font.
      /// General descriptions/body texts.
      bodyLarge: theme.textTheme.bodyLarge?.copyWith(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

      bodyMedium: theme.textTheme.bodyMedium?.copyWith(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      bodySmall: theme.textTheme.bodySmall?.copyWith(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      // endregion
      // region Labels. Used for button texts and other labels.
      /// App bar buttons
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

      /// Spaced, thinner section headlines
      labelMedium: theme.textTheme.labelMedium?.copyWith(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 8,
      ),
      // endregion
    );
  }
}
