import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MoodDoughnutChart extends StatefulWidget {
  final List<ChartData> moodDataMap;

  const MoodDoughnutChart({
    Key? key,
    required this.moodDataMap,
  }) : super(key: key);

  @override
  State<MoodDoughnutChart> createState() => _MoodDoughnutChartState();
}

class _MoodDoughnutChartState extends State<MoodDoughnutChart> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceWidth = context.deviceWidth;

    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: PhysicalModel(
            shape: BoxShape.circle,
            color: themeColorStyle.quinaryColor,
          ),
        ),
        CircularChartAnnotation(
          widget: CircleAvatar(
            radius: deviceWidth / 4,
            backgroundColor: themeColorStyle.quinaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mood of The Month',
                  style: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  '45%', // Percentage based on calculation
                  style: textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  'Productive',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: themeColorStyle.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          animationDuration: 0,
          dataSource: widget.moodDataMap,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (datum, index) => widget.moodDataMap[index].color,
          // Radius of doughnut
          radius: '105%',
          innerRadius: '60%',
        )
      ],
    );
  }
}

class ChartData {
  ChartData({required this.x, required this.y, required this.color});

  final String x;
  final double y;
  final Color color;
}
