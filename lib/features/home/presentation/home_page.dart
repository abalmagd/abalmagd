import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/presentation/widgets/portfolio_app_bar.dart';
import 'package:portfolio/features/home/presentation/views/intro_view.dart';
import 'package:portfolio/features/home/presentation/views/services_view.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PortfolioAppBar(scrollController: scrollController),
      extendBodyBehindAppBar: true,
      body: ListView(
        controller: scrollController,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: kToolbarHeight * 2,
        ),
        children: [
          const Center(child: IntroView()),
          const Gap(60),
          const ServicesView(),
          const Gap(60),
          Text(
            'Work In Progress',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
          const Placeholder(),
        ],
      ),
    );
  }
}
