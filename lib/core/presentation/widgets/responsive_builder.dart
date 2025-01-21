import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    this.onMobile,
    this.onTablet,
    this.onDesktop,
    this.mobileBreakpoint = 500,
    this.desktopBreakpoint = 900,
    this.debugCallback,
  }) : assert(
          onMobile != null || onTablet != null || onDesktop != null,
          'A widget must be passed to "ResponsiveBuilder"',
        );

  final Widget? onMobile;
  final Widget? onTablet;
  final Widget? onDesktop;
  final double mobileBreakpoint;
  final double desktopBreakpoint;
  final Function(BoxConstraints constraints)? debugCallback;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (kDebugMode && debugCallback != null) {
          debugCallback!(constraints);
        }

        if (width <= mobileBreakpoint && onMobile != null) return onMobile!;
        if (width >= desktopBreakpoint && onDesktop != null) return onDesktop!;

        return onTablet ?? onMobile ?? SizedBox.shrink();
      },
    );
  }
}
