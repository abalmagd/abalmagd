import 'package:flutter/material.dart';
import 'package:portfolio/core/config/theme/custom_theme.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahmoud Abulmajd',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme(context),
      home: const HomePage(),
    );
  }
}
