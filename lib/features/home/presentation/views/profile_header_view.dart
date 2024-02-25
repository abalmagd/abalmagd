import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/spacing.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:portfolio/utils/localization_tracker.dart';
import 'package:widget_mask/widget_mask.dart';

class ProfileHeaderView extends StatelessWidget {
  const ProfileHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: Spacing.webProfileHeaderHeight,
      child: WidgetMask(
        blendMode: BlendMode.difference,
        mask: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: Spacing.webHorizontalPadding,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(100),
                    Text(
                      MediaQuery.sizeOf(context).width.toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Hi, I am'.hardcoded,
                      style: theme.textTheme.displayMedium,
                    ),
                    const Gap(40),
                    Text(
                      Data.person.name,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      style: theme.textTheme.displayLarge,
                    ),
                    Text(
                      Data.person.position,
                      style: theme.textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              Image.asset(
                Assets.profileImage,
                alignment: Alignment.bottomCenter,
                height: Spacing.webProfileHeaderHeight * 0.9,
              ),
            ],
          ),
        ),
        child: CustomPaint(
          size: const Size(
            double.infinity,
            Spacing.webProfileHeaderHeight,
          ),
          painter: BackgroundPainter(),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  BackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.6, 0);
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
