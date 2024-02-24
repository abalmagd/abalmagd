import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/utils/localization_tracker.dart';

class ProfileHeaderView extends StatelessWidget {
  const ProfileHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, size.height),
            painter: TestPainter(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.webHorizontalPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi, I am'.hardcoded,
                        style: theme.textTheme.displayMedium,
                      ),
                      const Gap(40),
                      Text(
                        Data.person.name,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: theme.textTheme.displayLarge,
                      ),
                      Text(
                        Data.person.position,
                        style: theme.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    Assets.profileImage,
                    // width: size.width * 0.51,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(size.width, size.height);

    // TODO: Draw your path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
