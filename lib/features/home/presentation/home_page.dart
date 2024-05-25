import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/shared/presentation/widgets/app_bar.dart';
import 'package:portfolio/shared/presentation/widgets/brand.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final scrollController = useScrollController();
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 85),
            sliver: SliverAppBar(
              floating: true,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              title: Logo(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 5000,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
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
          SizedBox(
            height: 5000,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
