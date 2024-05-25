import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/shared/presentation/widgets/brand.dart';

// TODO: For each of these enum values, add a property to allow scrolling onTap.
enum AppBarButton {
  services(''),
  myWork(''),
  career(''),
  testimonials(''),
  education(''),
  contactMe('');

  final String scrollTo;

  const AppBarButton(this.scrollTo);
}

class MyAppBar extends HookWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final offsetAnimation = useMemoized(
      () => Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -1))
          .animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease),
      ),
    );
    useEffect(() {
      scrollController.addListener(() => scrollListener(animationController));
      return null;
    }, []);
    return SlideTransition(
      position: offsetAnimation,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * Spacing.horizontalPaddingResponsiveFactor,
              vertical: 16,
            ),
            child: Row(
              children: [
                const Logo(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: AppBarButton.values.map(
                      (btn) {
                        return TextButton(
                          onPressed: () {
                            switch (btn) {
                              case AppBarButton.services:
                              // TODO: Handle this case.
                              case AppBarButton.myWork:
                              // TODO: Handle this case.
                              case AppBarButton.career:
                              // TODO: Handle this case.
                              case AppBarButton.testimonials:
                              // TODO: Handle this case.
                              case AppBarButton.education:
                              // TODO: Handle this case.
                              case AppBarButton.contactMe:
                              // TODO: Handle this case.
                            }
                          },
                          child: Text(
                            btn.name.tr(),
                            style: textTheme.labelLarge,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                const Row(),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
}
