import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/domain/data.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.showIcon = true,
    this.showName = false,
  });

  final bool showIcon;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (showIcon) SvgPicture.asset(Data.person.logoPath, height: 34),
        if (showName) ...[
          const Gap(16),
          Text(
            Data.person.name.tr(),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(Assets.pfp),
    );
  }
}
