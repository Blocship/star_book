import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class StatsWidget extends StatelessWidget {
  final String pointsImagePath;
  final String points;
  final String streakImagePath;
  final String streak;

  const StatsWidget({
    Key? key,
    required this.pointsImagePath,
    required this.points,
    required this.streakImagePath,
    required this.streak,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    return Container(
      height: deviceHeight * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: themeColorStyle.secondaryColor.withOpacity(0.1),
            blurRadius: 100,
          ),
        ],
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCard(
            imagePath: pointsImagePath,
            count: points,
            title: 'Points',
          ),
          CustomCard(
            imagePath: streakImagePath,
            count: streak,
            title: 'Streak',
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String count;
  final String title;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.count,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: deviceHeight * 0.035),
          Image(image: AssetImage(imagePath), height: 55),
          SizedBox(height: deviceHeight * 0.025),
          Text(
            count,
            style: textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColorStyle.secondaryColor),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Text(
            title,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
