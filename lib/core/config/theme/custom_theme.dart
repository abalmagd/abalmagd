import 'package:flutter/material.dart';
import 'package:portfolio/core/config/theme/text_theme.dart';

import 'palette.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary.color),
      appBarTheme: AppBarTheme(backgroundColor: Palette.appBar.color),
      scaffoldBackgroundColor: Palette.black.color,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.transparent.color,
          overlayColor: Palette.white.color.withOpacity(0.1),
          textStyle: textTheme.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shadowColor: WidgetStatePropertyAll(
            Palette.primary.color.withOpacity(0.5),
          ),
          elevation: const WidgetStatePropertyAll(20),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(24)),
          surfaceTintColor: WidgetStatePropertyAll(
            Palette.primary.color.withOpacity(0.7),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(
                color: Palette.primary.color.withOpacity(0.7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      textTheme: TextThemes.textTheme(context).apply(
        bodyColor: Palette.bodyText.color,
      ),
    );
  }
}
