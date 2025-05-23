import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/data/local/shared_prefs.dart';
import 'package:portfolio/core/domain/localization/localization.dart';
import 'package:portfolio/core/presentation/providers/theme_provider.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/domain/constants/assets.dart';
import 'core/domain/data.dart';
import 'core/presentation/theme/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    EasyLocalization(
      supportedLocales:
          Localization.supportedLocales.map((locale) => locale.locale).toList(),
      path: Assets.translations,
      fallbackLocale: PortfolioLocale.en.locale,
      useOnlyLangCode: true,
      child: ProviderScope(
        overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
        child: const Portfolio(),
      ),
    ),
  );
}

class Portfolio extends ConsumerWidget with CustomTheme {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      onGenerateTitle: (context) => Data.person.name.tr(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ref.watch(themeProvider),
      home: const HomePage(),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        physics: const BouncingScrollPhysics(),
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
    );
  }
}
