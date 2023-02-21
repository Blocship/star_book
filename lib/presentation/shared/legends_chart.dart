import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class LegendsChart extends StatelessWidget {
  const LegendsChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    final DoughnutChartStyle doughnutChartStyle = context.doughnutChartStyle;

    return Container(
      height: deviceHeight * 0.15,
      decoration: BoxDecoration(
        color: themeColorStyle.quinaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.smallPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: doughnutChartStyle.primaryColor,
                  radius: 7,
                ),
                const Text('Productive'),
                SizedBox(width: deviceWidth * 0.03),
                CircleAvatar(
                  backgroundColor: doughnutChartStyle.secondaryColor,
                  radius: 7,
                ),
                const Text('Angry'),
                SizedBox(width: deviceWidth * 0.03),
                CircleAvatar(
                  backgroundColor: doughnutChartStyle.tertiaryColor,
                  radius: 7,
                ),
                const Text('Sick'),
                SizedBox(width: deviceWidth * 0.03),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: deviceWidth * 0.035),
                CircleAvatar(
                  backgroundColor: doughnutChartStyle.quinaryColor,
                  radius: 7,
                ),
                SizedBox(width: deviceWidth * 0.03),
                const Text('Sad'),
                SizedBox(width: deviceWidth * 0.2),
                CircleAvatar(
                  backgroundColor: doughnutChartStyle.quaternaryColor,
                  radius: 7,
                ),
                SizedBox(width: deviceWidth * 0.03),
                const Text('Happy'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
