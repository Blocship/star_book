import 'dart:math';

import 'package:flutter/material.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/models/mood/mood_frequency.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/widgets/arrow_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MoodDoughnutChart extends StatefulWidget {
  final Map<Mood, Frequency> moodDataMap;
  final bool isDataEmpty;

  const MoodDoughnutChart({
    Key? key,
    required this.moodDataMap,
    this.isDataEmpty = false,
  }) : super(key: key);

  @override
  State<MoodDoughnutChart> createState() => _MoodDoughnutChartState();
}

class _MoodDoughnutChartState extends State<MoodDoughnutChart> {
  @override
  Widget build(BuildContext context) {
    List<MoodData> moodList = [];
    widget.moodDataMap
        .forEach((k, v) => moodList.add(MoodData(mood: k, frequency: v)));
    // print('moodList: ${widget.moodDataMap.entries.map((e) => e.value)}');
    List<Frequency> yValues =
        widget.moodDataMap.entries.map((e) => e.value).toList();
    // print('yValues: $yValues');
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
                if (widget.isDataEmpty) ...[
                  Text(
                    'Jot wins, track progress',
                    style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ] else ...[
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
              ],
            ),
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<MoodData, String>(
          animationDuration: 0,
          dataSource: moodList,
          xValueMapper: (MoodData data, _) {
            // print('Mood: ${data.mood.label}');
            return data.mood.label;
          },
          yValueMapper: (MoodData data, _) {
            // print('Frequency: ${data.frequency}');
            return data.frequency;
          },
          pointColorMapper: (datum, index) {
            List<int> colorList =
                widget.moodDataMap.entries.map((e) => e.key.color).toList();
            // print('Color: ${colorList[index]}');
            return Color(colorList[index]);
          },

          /// Radius of doughnut
          radius: '105%',
          innerRadius: '60%',
        ),
      ],
    );
  }

  /// For getting the center angle of the highest sector
  double getHighestSectorCenterAngle(List<Frequency> sectorValues) {
    /// The index of highest sector
    int highestSectorIndex = 0;

    /// Initially, first sector supposed to be the highest
    /// value.
    Frequency highestSectorValue = sectorValues[0];

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
    Frequency totalValue = sectorValues.reduce((a, b) => a + b);

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
  final MoodFrequency moodFrequency;

  const ChartData({required this.moodFrequency});
}

// class ChartData {
//   ChartData({
//     required this.x,
//     this.y = 2.0,
//     required this.color,
//   });
//
//   final String x;
//   final double y;
//   final Color color;
// }

class MoodData {
  final Mood mood;
  final Frequency frequency;

  const MoodData({required this.mood, required this.frequency});
}
