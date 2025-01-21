import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/domain/localization/locale_keys.dart';
import 'package:portfolio/core/domain/localization/localization.dart';

class LocaleSwitch extends StatelessWidget {
  const LocaleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PopupMenuButton(
        itemBuilder: (context) {
          return Localization.supportedLocales.map((locale) {
            return PopupMenuItem(
              onTap: () => context.setLocale(locale.locale),
              child: Center(
                child: Text(
                  locale.locale.languageCode.tr(),
                  style: theme.textTheme.labelMedium,
                ),
              ),
            );
          }).toList();
        },
        tooltip: LocaleKeys.languages.tr(),
        color: theme.colorScheme.primaryContainer,
        position: PopupMenuPosition.under,
        child: const Icon(Icons.translate_rounded),
      ),
    );
  }
}
