import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../domain/data.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.showIcon = true,
    this.showIconGlow = true,
    this.showName = false,
  });

  final bool showIcon;
  final bool showIconGlow;
  final bool showName;

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
                  blurRadius: 0.12.dp,
                  offset: Offset(0, 0),
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
          Gap(2.w),
          Text(
            Data.person.name.tr(),
            style: theme.textTheme.labelMedium,
          ),
        ],
      ],
    );
  }
}
