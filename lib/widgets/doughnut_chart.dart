import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';
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
    // final List<ChartData> chartData = [
    //   ChartData(
    //     x: 'Productive',
    //     y: 3.5,
    //     color: const Color(0xFF8EFFA4),
    //   ),
    //   ChartData(
    //     x: 'Sad',
    //     y: 1.5,
    //     color: const Color(0xFF6C71FF),
    //   ),
    //   ChartData(
    //     x: 'Angry',
    //     y: 1.5,
    //     color: const Color(0xFFFF716C),
    //   ),
    //   ChartData(
    //     x: 'Happy',
    //     y: 1.5,
    //     color: const Color(0xFF60ABFF),
    //   ),
    //   ChartData(
    //     x: 'Sick',
    //     y: 2.0,
    //     color: const Color(0xFFFFC169),
    //   ),
    // ];
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: PhysicalModel(
            shape: BoxShape.circle,
            color: Theme.of(context).extension<ThemeColorStyle>()!.quinaryColor,
          ),
        ),
        CircularChartAnnotation(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Mood of The Month',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              // Text(
              //   '45%', // Percentage based on calculation
              //   style: Theme.of(context)
              //       .textTheme
              //       .headlineLarge!
              //       .copyWith(fontWeight: FontWeight.w700),
              // ),
              Text(
                'Productive',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .extension<ThemeColorStyle>()!
                          .secondaryColor,
                    ),
              ),
            ],
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: widget.moodDataMap,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (datum, index) => widget.moodDataMap[index].color,
          // Radius of doughnut
          radius: '75%',
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
