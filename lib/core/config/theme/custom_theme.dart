import 'package:flutter/material.dart';
import 'package:portfolio/core/config/theme/text_theme.dart';

import 'palette.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primaryColor),
      primaryColor: Palette.primaryColor,
      primaryColorLight: Palette.primaryColorLight,
      appBarTheme: const AppBarTheme(backgroundColor: Palette.transparent),
      scaffoldBackgroundColor: Palette.scaffoldBackgroundLight,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextThemes.textTheme(context).apply(
        bodyColor: Palette.darkTextColor,
        displayColor: Palette.darkTextColor,
      ),
    );
  }
}
