import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/shared/presentation/widgets/app_bar.dart';

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
    return Column(
      children: [
        const Gap(100),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                Assets.pfp,
                fit: BoxFit.cover,
                width: width * 0.25,
                height: width * 0.25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
