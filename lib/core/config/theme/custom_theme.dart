import 'package:flutter/material.dart';
import 'package:portfolio/core/config/theme/text_theme.dart';

import 'palette.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primaryColor,
        primary: Palette.primaryColor,
        secondary: Palette.secondaryColor,
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Palette.appBarBackground),
      scaffoldBackgroundColor: Palette.scaffoldBackgroundLight,
      textTheme: TextThemes.textTheme(context),
    );
  }
}
