import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/config/responsive.dart';

class TextThemes {
  static TextTheme textTheme(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);
    return TextTheme(
      // region Displays. Largest text. Used in portfolio header.
      /// Work Specialty
      displaySmall: theme.textTheme.displaySmall?.copyWith(
        fontFamily: 'Raleway',
        fontSize: isMobile ? 12 : 25,
        color: theme.colorScheme.secondary,
        fontVariations: [const FontVariation('wght', 800)],
      ),

      /// Hi, I am
      displayMedium: theme.textTheme.displaySmall?.copyWith(
        fontFamily: 'Raleway',
        fontSize: isMobile ? 20 : 40,
        fontVariations: [const FontVariation('wght', 700)],
      ),

      /// My name
      displayLarge: theme.textTheme.displaySmall?.copyWith(
        fontFamily: 'Raleway',
        fontSize: isMobile ? 35 : 80,
        fontVariations: [const FontVariation('wght', 700)],
      ),
      // endregion
      // region Headlines. Used for section headlines and skill titles.
      /// Section headlines
      headlineLarge: theme.textTheme.headlineLarge?.copyWith(
        fontFamily: 'Montserrat',
        fontSize: isMobile ? 14 : 30,
        fontVariations: [const FontVariation('wght', 700)],
      ),

      /// Skill titles
      headlineMedium: theme.textTheme.headlineMedium?.copyWith(
        fontFamily: 'Montserrat',
        fontSize: 24,
        fontVariations: [const FontVariation('wght', 400)],
      ),

      /// Other headlines
      headlineSmall: theme.textTheme.headlineSmall?.copyWith(
        fontFamily: 'Montserrat',
        fontSize: 15,
        fontVariations: [const FontVariation('wght', 700)],
      ),
      // endregion
      // region Body. Used for description texts.
      /// General descriptions
      bodyLarge: theme.textTheme.bodyLarge?.copyWith(
        fontFamily: 'Open Sans',
        fontSize: 15,
        fontVariations: [const FontVariation('wght', 400)],
      ),

      /// Working points description (Development, maintenance, etc)
      bodyMedium: theme.textTheme.bodyMedium?.copyWith(
        fontFamily: 'Open Sans',
        fontSize: 14,
        fontVariations: [const FontVariation('wght', 300)],
      ),

      /// Project description
      bodySmall: theme.textTheme.bodySmall?.copyWith(
        fontFamily: 'Open Sans',
        fontSize: 14,
        fontVariations: [const FontVariation('wght', 300)],
      ),
      // endregion
      // region Labels. Used for app bar buttons and minor section headers.
      /// App bar
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        fontFamily: 'Montserrat',
        fontSize: isMobile ? 12 : 17,
        fontVariations: [FontVariation('wght', isMobile ? 600 : 700)],
      ),

      /// Buttons
      labelMedium: theme.textTheme.labelMedium?.copyWith(
        fontFamily: 'Montserrat',
        fontSize: isMobile ? 13 : 16,
        fontVariations: [const FontVariation('wght', 700)],
      ),

      /// Text fields
      labelSmall: theme.textTheme.labelSmall?.copyWith(
        fontFamily: 'Montserrat',
        fontSize: isMobile ? 12 : 14,
        fontVariations: [const FontVariation('wght', 700)],
      ),
      // labelMedium: ,
      // labelLarge: ,
      // endregion
    );
  }
}
