import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../domain/data.dart';

class Brand extends StatelessWidget {
  const Brand({
    super.key,
    this.showIcon = true,
    this.showIconGlow = true,
    this.showName = false,
    this.customName,
  });

  final bool showIcon;
  final bool showIconGlow;
  final bool showName;
  final String? customName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (showIcon)
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary
                      .withValues(alpha: showIconGlow ? 0.5 : 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: SvgPicture.asset(
              Data.person.logo,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        if (showName) ...[
          const Gap(14),
          Text(
            customName ?? Data.person.name.tr(),
            style: theme.textTheme.labelMedium,
          ),
        ],
      ],
    );
  }
}
