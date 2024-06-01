import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:marqueer/marqueer.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/localization.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/features/about_me/domain/models/skill.dart';
import 'package:portfolio/features/about_me/presentation/widgets/skill_card.dart';

class AboutMe extends HookWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Spacing.sectionHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Data.person.name.tr(),
                      style: textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const Gap(10),
                    SizedBox(
                      width: width * 0.4,
                      child: Text(
                        Data.person.description.tr(),
                        style: textTheme.bodyMedium,
                      ),
                    ),
                    const Gap(30),
                    FilledButton(
                      // TODO: Scroll to next section
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(Localization.letsGetStarted.tr()),
                          const Gap(12),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: width * 0.14,
                backgroundImage: const AssetImage(Assets.pfp),
              ),
            ],
          ),
          const Gap(60),
          Text(Localization.workedWith.tr(), style: textTheme.bodyMedium),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              height: 60,
              child: Marqueer.builder(
                pps: 60,
                itemBuilder: (_, index) {
                  return SkillCard(skill: Skill.values[index]);
                },
                separatorBuilder: (_, __) => const Gap(20),
                itemCount: Skill.values.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
