import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/domain/data.dart';

class Brand extends StatelessWidget {
  const Brand({
    super.key,
    this.iconOnly = false,
    this.nameOnly = false,
    this.fullName = false,
  }) : assert(
          (!iconOnly || nameOnly) && (!nameOnly || iconOnly),
          'Either "iconOnly" or "nameOnly" must be true, but not both.',
        );

  final bool iconOnly;
  final bool nameOnly;
  final bool fullName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (!nameOnly) SvgPicture.asset(Assets.brandLetter, height: 34),
        if (!iconOnly) ...[
          const Gap(16),
          Text(
            '${Data.person.firstName.tr()} ${fullName ? Data.person.lastName.tr() : ''}',
            style: theme.textTheme.headlineLarge?.copyWith(fontSize: 24),
          ),
        ],
      ],
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Transform.rotate(
          angle: -9 * (pi / 180),
          child: Container(
            width: 340,
            height: 400,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.bottomLeft,
          ),
        ),
        Container(
          width: 340,
          height: 400,
          decoration: BoxDecoration(
            color: theme.primaryColorLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Transform.translate(
                offset: const Offset(200, -100),
                child: Transform.rotate(
                  angle: -44 * (pi / 180),
                  child: Column(
                    children: List.generate(
                      12,
                      (index) => const Divider(
                        indent: 20,
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(Assets.profilePicture),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
