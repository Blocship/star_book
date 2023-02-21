import 'package:flutter/material.dart';
import 'package:star_book/presentation/shared/legends_chart.dart';
import 'package:star_book/presentation/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/widgets/doughnut_chart.dart';

class MonthlyAnalyticsTab extends StatelessWidget {
  const MonthlyAnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    final DoughnutChartStyle doughnutChartStyle = context.doughnutChartStyle;
    final List<ChartData> data = [
      ChartData(
          x: 'Productive', y: 3.5, color: doughnutChartStyle.primaryColor),
      ChartData(x: 'Sad', y: 1.5, color: doughnutChartStyle.secondaryColor),
      ChartData(x: 'Angry', y: 1.5, color: doughnutChartStyle.tertiaryColor),
      ChartData(x: 'Happy', y: 1.5, color: doughnutChartStyle.quinaryColor),
      ChartData(x: 'Sick', y: 2.0, color: doughnutChartStyle.quaternaryColor),
    ];
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: Column(
        children: [
          MoodDoughnutChart(moodDataMap: data),
          SizedBox(height: deviceHeight * 0.05),
          const SelectableTab(),
          SizedBox(height: deviceHeight * 0.03),
          const LegendsChart(),
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
