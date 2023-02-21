import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/widgets/doughnut_chart.dart';

class MonthlyAnalyticsTab extends StatelessWidget {
  const MonthlyAnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    final DoughnutChartStyle doughnutChartStyle = context.doughnutChartStyle;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: Column(
        children: [
          MoodDoughnutChart(
            moodDataMap: [
              ChartData(
                  x: 'Productive',
                  y: 3.5,
                  color: doughnutChartStyle.primaryColor),
              ChartData(
                  x: 'Sad', y: 1.5, color: doughnutChartStyle.secondaryColor),
              ChartData(
                  x: 'Angry', y: 1.5, color: doughnutChartStyle.tertiaryColor),
              ChartData(
                  x: 'Happy', y: 1.5, color: doughnutChartStyle.quinaryColor),
              ChartData(
                  x: 'Sick', y: 2.0, color: doughnutChartStyle.quaternaryColor),
            ],
          ),
          SizedBox(height: deviceHeight * 0.05),
          const SelectableTab(),
          SizedBox(height: deviceHeight * 0.03),
          Container(
            height: deviceHeight * 0.15,
            decoration: BoxDecoration(
              color: themeColorStyle.quinaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomPadding.smallPadding),
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
          ),
        ],
      ),
    );
  }
}

class SelectableTab extends StatefulWidget {
  const SelectableTab({super.key});

  @override
  State<SelectableTab> createState() => _SelectableTabState();
}

class _SelectableTabState extends State<SelectableTab> {
  String selectedMonths = 'Jan';

  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: months.map((month) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedMonths = month;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: (month == selectedMonths)
                  ? themeColorStyle.secondaryColor
                  : themeColorStyle.secondaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: Text(
              month,
              style: textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: (month == selectedMonths)
                    ? themeColorStyle.quinaryColor
                    : themeColorStyle.secondaryColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
