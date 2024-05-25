import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/config/theme/custom_theme.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';

import 'core/constants/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: Localization.supportedLocales,
      path: Assets.translations,
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Data.person.name,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomTheme.lightTheme(context),
      home: const HomePage(),
    );
  }
}
