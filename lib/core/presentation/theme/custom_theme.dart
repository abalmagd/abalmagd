import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/domain/localization/localization.dart';
import 'package:portfolio/core/presentation/theme/text_theme.dart';

import 'palette.dart';

mixin CustomTheme {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Palette.primary,
        primary: Palette.primary,
        surface: Palette.surfaceLight,
        inverseSurface: Palette.surfaceDark,
        primaryContainer: Palette.primaryContainerLight,
        dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
      ),
      textTheme: TextThemes.textTheme(context).apply(
        fontFamily:
            Localization.isRTL(EasyLocalization.of(context)?.currentLocale)
                ? 'Cairo'
                : 'Poppins',
        bodyColor: Palette.black,
        displayColor: Palette.black,
      ),
      dividerColor: Palette.dividerLight,
      dividerTheme: DividerThemeData(color: Palette.dividerLight),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
        inverseSurface: Palette.surfaceLight,
        primaryContainer: Palette.primaryContainerDark,
        dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
      ),
      textTheme: TextThemes.textTheme(context).apply(
        fontFamily:
            Localization.isRTL(EasyLocalization.of(context)?.currentLocale)
                ? 'Cairo'
                : 'Poppins',
        bodyColor: Palette.white,
        displayColor: Palette.white,
      ),
      dividerColor: Palette.dividerDark,
      dividerTheme: DividerThemeData(color: Palette.dividerDark),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
      iconTheme: IconThemeData(color: Palette.white),
    );
  }
}
