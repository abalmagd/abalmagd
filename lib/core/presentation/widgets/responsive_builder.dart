import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.onMobile,
    required this.onTablet,
    required this.onDesktop,
  });

  final Widget? onMobile;
  final Widget? onTablet;
  final Widget? onDesktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
        return SizedBox();
      },
    );
  }
}
