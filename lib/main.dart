import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/domain/localization/localization.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';
import 'package:sizer/sizer.dart';

import 'core/domain/constants/assets.dart';
import 'core/domain/data.dart';
import 'core/presentation/theme/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: Localization.supportedLocales,
      path: Assets.translations,
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const Portfolio(),
    ),
  );
}

class Portfolio extends StatelessWidget with CustomTheme {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: Data.person.name,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: lightTheme(context),
          darkTheme: darkTheme(context),
          themeMode: ThemeMode.light,
          home: HomePage(),
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            physics: const BouncingScrollPhysics(),
            dragDevices: PointerDeviceKind.values.toSet(),
          ),
        );
      },
    );
  }
}
