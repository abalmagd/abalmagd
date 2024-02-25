import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/features/home/presentation/views/profile_header_view.dart';
import 'package:portfolio/features/home/presentation/widgets/app_bar.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const MyAppBar(),
      extendBodyBehindAppBar: true,
      body: WebSmoothScroll(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ProfileHeaderView(),
          ],
        ),
      ),
    );
  }
}
