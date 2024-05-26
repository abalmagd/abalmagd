import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/localization.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/shared/presentation/widgets/app_bar.dart';
import 'package:portfolio/utils/extensions/string_extensions.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final scrollController = useScrollController();
    useEffect(() => scrollController.dispose, []);
    return Scaffold(
      appBar: MyAppBar(scrollController: scrollController),
      extendBodyBehindAppBar: true,
      body: ListView(
        controller: scrollController,
        padding: EdgeInsets.symmetric(
          horizontal: width * Spacing.horizontalPaddingResponsiveFactor,
          vertical: 20,
        ),
        physics: const BouncingScrollPhysics(),
        children: const [
          AboutMe(),
        ],
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
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
                          Text(Localization.letsGetStarted.hardcoded),
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
          Text(Localization.workedWith.hardcoded, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
