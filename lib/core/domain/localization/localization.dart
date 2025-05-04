import 'dart:ui';

/// Generate LocaleKeys using this command:
/// ```flutter pub run easy_localization:generate -f keys -o locale_keys.dart -S assets/translations/ -O lib/core/domain/localization```

enum PortfolioLocale {
  ar(Locale('ar'), TextDirection.rtl),
  en(Locale('en'), TextDirection.ltr);

  final Locale locale;
  final TextDirection textDirection;

  const PortfolioLocale(this.locale, this.textDirection);
}

class Localization {
  static const supportedLocales = PortfolioLocale.values;

  static bool isRTL(Locale? locale) {
    final portfolioLocale = PortfolioLocale.values.singleWhere(
      (portfolioLocale) => portfolioLocale.locale == locale,
      orElse: () => PortfolioLocale.en,
    );

    return portfolioLocale.textDirection == TextDirection.rtl;
  }
}
