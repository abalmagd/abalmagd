import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/config/responsive.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/shared/presentation/widgets/brand.dart';

class PersonInfoView extends StatelessWidget {
  const PersonInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 160),
      child: Responsive.isMobile(context)
          ? PersonInfoViewMobile()
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('myNameIs'.tr(), style: theme.textTheme.labelMedium),
                      const Gap(16),
                      Text.rich(
                        TextSpan(
                          text: Data.person.firstName.tr(),
                          children: [
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: Data.person.lastName.tr(),
                              style: theme.textTheme.headlineLarge?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        style: theme.textTheme.headlineLarge,
                      ),
                      const Gap(32),
                      Text(
                        Data.person.description.tr(),
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ProfilePicture(imagePath: Data.person.imagePath),
              ],
            ),
    );
  }
}

class PersonInfoViewMobile extends StatelessWidget {
  const PersonInfoViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ProfilePicture(imagePath: Data.person.imagePath),
        const SizedBox(height: 100),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('myNameIs'.tr(), style: theme.textTheme.labelMedium),
            const Gap(16),
            Text.rich(
              TextSpan(
                text: Data.person.firstName.tr(),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: Data.person.lastName.tr(),
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              style: theme.textTheme.headlineLarge,
            ),
            const Gap(32),
            Text(
              Data.person.description.tr(),
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
