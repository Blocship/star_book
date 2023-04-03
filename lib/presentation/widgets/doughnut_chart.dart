import 'dart:math';
import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/widgets/arrow_indicator.dart';
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
    List<double> yValues =
        widget.moodDataMap.map((ChartData chartData) => chartData.y).toList();
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceWidth = context.deviceWidth;
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget:
              ArrowIndicator(direction: getHighestSectorCenterAngle(yValues)),
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

  /// For getting the center angle of the highest sector
  double getHighestSectorCenterAngle(List<double> sectorValues) {
    /// The index of highest sector
    int highestSectorIndex = 0;

    /// Initially, first sector supposed to be the highest
    /// value.
    double highestSectorValue = sectorValues[0];

    /// Finding the index of the highest sector and its value
    for (int i = 1; i < sectorValues.length; i++) {
      if (sectorValues[i] > highestSectorValue) {
        highestSectorIndex = i;
        highestSectorValue = sectorValues[i];
      }
    }

    /// Calculating the starting and ending angles for each sector
    /// Store List of sectors angles
    List<double> sectorAngles = [];

    /// Get the sum of sector values
    double totalValue = sectorValues.reduce((a, b) => a + b);

    /// Use for startAngle
    double startAngle = 0;

    /// Getting Starting Angle
    for (int i = 0; i < sectorValues.length; i++) {
      double sectorAngle = (sectorValues[i] / totalValue) * 2 * pi;
      sectorAngles.add(startAngle + sectorAngle);
      startAngle += sectorAngle;
    }

    /// Calculating the center point angle of the highest sector
    double centerAngle = 0.0;
    if (highestSectorIndex == 0) {
      centerAngle = sectorAngles[highestSectorIndex] / 2;
    } else {
      centerAngle = (sectorAngles[highestSectorIndex - 1] +
              sectorAngles[highestSectorIndex]) /
          2;
    }
    return centerAngle;
  }
}

class ChartData {
  ChartData({
    required this.x,
    this.y = 2.0,
    required this.color,
  });

  final String x;
  final double y;
  final Color color;
}
