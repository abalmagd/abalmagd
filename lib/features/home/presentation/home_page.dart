import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/features/about_me/presentation/about_me_view.dart';
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
