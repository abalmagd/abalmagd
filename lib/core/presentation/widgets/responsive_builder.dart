import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/domain/constants/constants.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    this.onMobile,
    this.onTablet,
    this.onDesktop,
    this.mobileBreakpoint,
    this.desktopBreakpoint,
    this.debugCallback,
  }) : assert(
          onMobile != null || onTablet != null || onDesktop != null,
          'A widget must be passed to "ResponsiveBuilder"',
        );

  final Widget? onMobile;
  final Widget? onTablet;
  final Widget? onDesktop;
  final double? mobileBreakpoint;
  final double? desktopBreakpoint;
  final Function(BoxConstraints constraints, double width)? debugCallback;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (kDebugMode && debugCallback != null) {
          debugCallback!(constraints, width);
        }

        if (width <= (mobileBreakpoint ?? Constants.mobileBreakpoint) &&
            onMobile != null) {
          return onMobile!;
        }
        if (width >= (desktopBreakpoint ?? Constants.desktopBreakpoint) &&
            onDesktop != null) {
          return onDesktop!;
        }

        return onTablet ?? onMobile ?? const SizedBox.shrink();
      },
    );
  }
}
