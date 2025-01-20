import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio/core/presentation/widgets/portfolio_app_bar.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return Scaffold(
      appBar: PortfolioAppBar(scrollController: scrollController),
      extendBodyBehindAppBar: true,
      body: ListView(
        controller: scrollController,
        children: [
          Image.asset(
            'assets/images/pfp2.jpg',
            height: 2000,
            fit: BoxFit.fitHeight,
          ),
          Container(
            color: Colors.blueGrey,
            height: 10000,
            width: double.infinity,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
