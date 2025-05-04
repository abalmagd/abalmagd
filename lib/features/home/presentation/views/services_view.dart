import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/domain/constants/constants.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/core/domain/localization/locale_keys.dart';
import 'package:portfolio/core/domain/models/service.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(LocaleKeys.services.tr(), style: theme.textTheme.titleMedium),
        const Gap(16),
        Text(
          LocaleKeys.servicesDesc.tr(),
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const Gap(32),
        Wrap(
          spacing: 32,
          runSpacing: 32,
          children: Data.person.services
              .map((service) => ServiceCard(service: service))
              .toList(),
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});

  final PortfolioService service;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width <= Constants.mobileBreakpoint ? width : 320,
      height: 350,
      child: Card(
        color: theme.colorScheme.primaryContainer,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: InkWell(
          /// Empty callback only for ripple effect
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(12),
                SvgPicture.asset(
                  service.icon,
                  height: 80,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.inverseSurface,
                    BlendMode.srcIn,
                  ),
                ),
                const Gap(26),
                Text(service.title.tr(), style: theme.textTheme.labelLarge),
                const Gap(16),
                Text(
                  service.description.tr(),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
