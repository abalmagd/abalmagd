import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextThemes {
  static TextTheme textTheme(BuildContext context) {
    final theme = Theme.of(context);
    return TextTheme(
      // region Titles
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        fontSize: 50.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: theme.textTheme.titleMedium?.copyWith(
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
      ),
      // endregion
      // region Body
      bodyLarge: theme.textTheme.bodyLarge?.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 9.sp,
        fontWeight: FontWeight.w400,
      ),
      // endregion
      // region Labels
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      // App bar buttons
      labelMedium: theme.textTheme.labelMedium?.copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      ),
      // All buttons & text field titles
      labelSmall: theme.textTheme.labelSmall?.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
      // endregion
    );
  }
}
