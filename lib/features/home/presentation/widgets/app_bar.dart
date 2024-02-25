import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/domain/data.dart';

// TODO: For each of these enum values, add a property to allow scrolling onTap.
enum AppBarButton {
  aboutMe(''),
  skills(''),
  portfolio(''),
  contactMe('', true);

  final bool hasBackground;
  final String scrollTo;

  const AppBarButton(this.scrollTo, [this.hasBackground = false]);
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(Data.person.brand),
        Row(
          children: AppBarButton.values.map(
            (btn) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextButton(
                  onPressed: () {
                    switch (btn) {
                      case AppBarButton.aboutMe:
                      // TODO: Handle this case.
                      case AppBarButton.skills:
                      // TODO: Handle this case.
                      case AppBarButton.portfolio:
                      // TODO: Handle this case.
                      case AppBarButton.contactMe:
                      // TODO: Handle this case.
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: btn.hasBackground
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.primary,
                    padding: const EdgeInsets.all(18),
                  ),
                  child: Text(
                    btn.name.toUpperCase(),
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: btn.hasBackground
                          ? null
                          : theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}
