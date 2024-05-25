import 'package:flutter/material.dart';
import 'package:portfolio/core/config/theme/text_theme.dart';

import 'palette.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary.color),
      primaryColor: Palette.primary.color,
      appBarTheme: AppBarTheme(backgroundColor: Palette.appBar.color),
      scaffoldBackgroundColor: Palette.black.color,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.transparent.color,
          textStyle: textTheme.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(),
      textTheme: TextThemes.textTheme(context).apply(
        bodyColor: Palette.bodyText.color,
      ),
    );
  }
}
