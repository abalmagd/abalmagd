import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/config/theme/palette.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/shared/presentation/widgets/brand.dart';

// TODO: For each of these enum values, add a property to allow scrolling onTap.
enum AppBarButton {
  aboutMe(''),
  services(''),
  career(''),
  testimonials(''),
  projects(''),
  contactMe('');

  final String scrollTo;

  const AppBarButton(this.scrollTo);
}

class MyAppBar extends HookWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

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
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final offsetAnimation = useMemoized(
      () => Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -1))
          .animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease),
      ),
    );
    useEffect(() {
      scrollController.addListener(() => scrollListener(animationController));
      return scrollController.dispose;
    }, []);
    return SlideTransition(
      position: offsetAnimation,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * Spacing.horizontalPaddingResponsiveFactor,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Palette.appBar.color,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              const Logo(),
              const Gap(20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: AppBarButton.values.map(
                    (btn) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextButton(
                          onPressed: () {
                            switch (btn) {
                              case AppBarButton.aboutMe:
                                animateToPosition(offset: 0);
                              case AppBarButton.services:
                              // TODO: Handle this case.
                              case AppBarButton.career:
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
                            btn.name.tr(),
                            style: textTheme.labelMedium,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Row(
                children: Data.person.socialLinks.map(
                  (btn) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: InkWell(
                        onTap: () {
                          js.context.callMethod('open', [btn.url]);
                        },
                        child: Tooltip(
                          message: btn.name.tr(),
                          verticalOffset: 28,
                          preferBelow: true,
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(btn.icon, width: 40),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
