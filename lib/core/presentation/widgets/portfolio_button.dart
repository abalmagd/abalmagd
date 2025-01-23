import 'package:flutter/material.dart';

class PortfolioButton extends StatelessWidget {
  const PortfolioButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.labelStyle,
    this.labelPadding,
    this.minimumSize,
  });

  final VoidCallback onPressed;
  final String label;
  final TextStyle? labelStyle;
  final EdgeInsets? labelPadding;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton(
      onPressed: onPressed,
      style: theme.filledButtonTheme.style?.copyWith(
        padding: WidgetStatePropertyAll(labelPadding),
        minimumSize: WidgetStatePropertyAll(minimumSize),
      ),
      child: Text(
        label,
        style: labelStyle ??
            theme.textTheme.labelSmall
                ?.copyWith(color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
