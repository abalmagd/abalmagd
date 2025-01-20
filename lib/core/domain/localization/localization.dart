import 'dart:ui';

/// Generate LocaleKeys using this command:
/// ```flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations/ -O lib/core/domain/localization```
class Localization {
  static const supportedLocales = [Locale('en'), Locale('ar')];
}
