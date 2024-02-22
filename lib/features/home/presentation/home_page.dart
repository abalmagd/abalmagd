import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Lorem Ipsum Small',
            style: theme.textTheme.displaySmall,
          ),
          Text(
            'Lorem Ipsum Medium',
            style: theme.textTheme.displayMedium,
          ),
          Text(
            'Lorem Ipsum Large',
            style: theme.textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
