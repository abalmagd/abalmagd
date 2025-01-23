import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/domain/constants/constants.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/core/domain/localization/locale_keys.dart';
import 'package:portfolio/core/presentation/widgets/portfolio_button.dart';
import 'package:portfolio/core/presentation/widgets/responsive_builder.dart';
import 'package:portfolio/features/home/presentation/providers/home_controller_provider.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      onMobile: Column(
        children: [
          ImageHalf(),
          Gap(16),
          TextHalf(),
        ],
      ),
      onDesktop: Row(
        children: [
          Expanded(child: TextHalf()),
          Gap(40),
          ImageHalf(),
        ],
      ),
    );
  }
}

class TextHalf extends StatelessWidget {
  const TextHalf({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: width < Constants.desktopBreakpoint
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.hiIam.tr(),
          style: theme.textTheme.labelMedium,
        ),
        const Gap(8),
        Text(
          Data.person.name.tr(),
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const Gap(12),
        FittedBox(
          child: Text(
            Data.person.jobTitle.tr().replaceAll(' ', '\n'),
            style: theme.textTheme.titleLarge?.copyWith(
              height: 1,
            ),
            textAlign:
                width < Constants.desktopBreakpoint ? TextAlign.center : null,
          ),
        ),
        const Gap(32),
        Text(
          Data.person.intro.tr(),
          style: theme.textTheme.bodyMedium,
        ),
        const Gap(32),
        PortfolioButton(
          // TODO: Implement, show dialog or animate to position
          onPressed: () {},
          label: LocaleKeys.hireMe.tr(),
          labelStyle: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onPrimary,
          ),
          minimumSize: width < Constants.desktopBreakpoint
              ? const Size.fromHeight(64)
              : Size(width * 0.25, 64),
        ),
      ],
    );
  }
}

class ImageHalf extends ConsumerWidget {
  const ImageHalf({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Column(
      children: [
        FittedBox(
          child: SizedBox(
            height: 500,
            width: 500,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: GradientBoxBorder(
                  width: 4,
                  gradient: LinearGradient(
                    stops: const [0, 0.75],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.surface,
                    ],
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(Data.person.image),
                ),
              ),
            ),
          ),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: Data.person.socialLinks.map((link) {
            return IconButton(
              onPressed: () => ref
                  .read(homeControllerProvider.notifier)
                  .openSocialLink(link.url),
              icon: SvgPicture.asset(
                link.icon,
                width: 28,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.inverseSurface,
                  BlendMode.srcIn,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
