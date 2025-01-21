import 'package:flutter/material.dart';
import 'package:portfolio/core/presentation/theme/text_theme.dart';
import 'package:sizer/sizer.dart';

import 'palette.dart';

mixin CustomTheme {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary,
        primary: Palette.primary,
        surface: Palette.surfaceLight,
        primaryContainer: Palette.primaryContainerLight,
        dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
      ),
      textTheme: TextThemes.textTheme(context).apply(
        fontFamily: 'Poppins',
        bodyColor: Palette.black,
        displayColor: Palette.black,
      ),
      dividerColor: Palette.dividerLight,
      dividerTheme: DividerThemeData(color: Palette.dividerLight),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.05.dp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0.1.dp),
        ),
      ),
      iconTheme: IconThemeData(color: Palette.black),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary,
        primary: Palette.primary,
        surface: Palette.surfaceDark,
        primaryContainer: Palette.primaryContainerDark,
        dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
      ),
      textTheme: TextThemes.textTheme(context).apply(
        fontFamily: 'Poppins',
        bodyColor: Palette.white,
        displayColor: Palette.white,
      ),
      dividerColor: Palette.dividerDark,
      dividerTheme: DividerThemeData(color: Palette.dividerDark),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.05.dp),
          ),
          padding: EdgeInsets.symmetric(horizontal: 0.1.dp),
        ),
      ),
      iconTheme: IconThemeData(color: Palette.white),
    );
  }
}
