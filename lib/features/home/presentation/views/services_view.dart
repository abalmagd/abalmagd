import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/core/domain/localization/locale_keys.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(LocaleKeys.services.tr(), style: theme.textTheme.titleMedium),
        const Gap(16),
        Text(LocaleKeys.servicesDesc.tr(), style: theme.textTheme.bodyMedium),
        const Gap(32),
        Wrap(
          spacing: 32,
          runSpacing: 32,
          children: Data.person.services.map((service) {
            return Text(service.title.tr());
          }).toList(),
        ),
      ],
    );
  }
}
