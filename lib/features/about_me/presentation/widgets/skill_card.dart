import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/config/theme/palette.dart';
import 'package:portfolio/features/about_me/domain/models/skill.dart';

class SkillCard extends HookWidget {
  const SkillCard({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isHovering = useState(false);
    return InkWell(
      onTap: () {},
      overlayColor: WidgetStatePropertyAll(Palette.transparent.color),
      splashFactory: NoSplash.splashFactory,
      onHover: (over) => isHovering.value = over,
      enableFeedback: false,
      mouseCursor: MouseCursor.uncontrolled,
      child: AnimatedContainer(
        height: 60,
        width: isHovering.value ? 160 : 80,
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovering.value ? Colors.white : null,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isHovering.value ? Colors.white : Colors.grey,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: AnimatedOpacity(
                opacity: isHovering.value ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  skill.name,
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall?.copyWith(color: Colors.black),
                ),
              ),
            ),
            AnimatedAlign(
              alignment:
                  isHovering.value ? Alignment.centerLeft : Alignment.center,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(
                skill.icon,
                fit: BoxFit.contain,
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
