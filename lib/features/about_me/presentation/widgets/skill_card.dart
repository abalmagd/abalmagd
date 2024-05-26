import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/config/theme/palette.dart';

class SkillCard extends HookWidget {
  const SkillCard({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    final isHovering = useState(false);
    return InkWell(
      onTap: () {},
      overlayColor: WidgetStatePropertyAll(Palette.transparent.color),
      splashFactory: NoSplash.splashFactory,
      onHover: (over) => isHovering.value = over,
      enableFeedback: false,
      mouseCursor: MouseCursor.uncontrolled,
      child: Container(
        height: 60,
        width: 160,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isHovering.value ? Colors.white : null,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isHovering.value ? Colors.white : Colors.grey,
          ),
        ),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
          colorFilter: isHovering.value
              ? null
              : const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
        ),
      ),
    );
  }
}
