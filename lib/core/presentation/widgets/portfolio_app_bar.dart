import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/core/domain/localization/locale_keys.dart';
import 'package:portfolio/core/presentation/providers/core_provider.dart';
import 'package:portfolio/core/presentation/widgets/glass_container.dart';
import 'package:portfolio/core/presentation/widgets/locale_switch.dart';
import 'package:portfolio/core/presentation/widgets/portfolio_button.dart';
import 'package:portfolio/core/presentation/widgets/responsive_builder.dart';
import 'package:portfolio/core/presentation/widgets/theme_switch.dart';

import 'brand.dart';

enum AppBarButton {
  aboutMe(LocaleKeys.aboutMe),
  services(LocaleKeys.services),
  testimonials(LocaleKeys.testimonials),
  projects(LocaleKeys.projects),
  contactMe(LocaleKeys.contactMe);

  final String title;

  const AppBarButton(this.title);
}

class PortfolioAppBar extends HookWidget implements PreferredSizeWidget {
  const PortfolioAppBar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 5);

  void scrollListener(AnimationController animationController) {
    if (scrollController.offset <= kToolbarHeight ||
        scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
      animationController.reverse();
      return;
    }

    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      animationController.forward();
    }
  }

  void animateToPosition({required double offset}) {
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final offsetAnimation = useMemoized(
      () {
        return Tween(
          begin: const Offset(0, 0),
          end: const Offset(0, -1),
        ).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        );
      },
    );
    useEffect(() {
      scrollController.addListener(() => scrollListener(animationController));
      return scrollController.dispose;
    }, []);
    return SlideTransition(
      position: offsetAnimation,
      child: GlassContainer(
        color: theme.colorScheme.surface.withValues(alpha: 0.35),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(
              showName: true,
              customName: Data.person.name.tr().replaceAll(' ', '\n'),
            ),
            Expanded(
              child: ResponsiveBuilder(
                onDesktop: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: AppBarButton.values.map((btn) {
                    return TextButton(
                      onPressed: () {
                        switch (btn) {
                          case AppBarButton.aboutMe:
                          // TODO: Handle this case.
                          case AppBarButton.services:
                          // TODO: Handle this case.
                          case AppBarButton.testimonials:
                          // TODO: Handle this case.
                          case AppBarButton.projects:
                          // TODO: Handle this case.
                          case AppBarButton.contactMe:
                          // TODO: Handle this case.
                        }
                      },
                      child: Text(
                        btn.title.tr(),
                        style: theme.textTheme.labelSmall,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const ThemeSwitch(),
            const LocaleSwitch(),
            const Gap(16),
            ResponsiveBuilder(
              onMobile: IconButton(
                // TODO: Implement
                onPressed: () {},
                icon: const Icon(Icons.menu_rounded),
              ),
              onDesktop: Consumer(builder: (context, ref, child) {
                return PortfolioButton(
                  onPressed:
                      ref.read(coreControllerProvider.notifier).downloadCV,
                  label: LocaleKeys.downloadCV.tr(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
