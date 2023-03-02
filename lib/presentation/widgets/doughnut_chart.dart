import 'dart:math';

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
    double highestValue = highestSector(widget.moodDataMap);
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceWidth = context.deviceWidth;
    print(highestValue);
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: ArrowIndicator(direction: pi / 2),
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

  double highestSector(List<ChartData> data) {
    double highestAngle = 0.0;
    for (int i = 0; i < data.length; i++) {
      // Checking for largest value in the list
      if (data[i].y > highestAngle) {
        highestAngle = data[i].y;
      }
    }

    return highestAngle;
  }
}

class ChartData {
  ChartData({required this.x, required this.y, required this.color});

  final String x;
  final double y;
  final Color color;
}

class ArrowIndicator extends StatelessWidget {
  final double direction;
  const ArrowIndicator({Key? key, required this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // angle should be in radian
      // so rad = degree * pi / 180
      // since motion is relative, we move the phone
      // not the arrow, so -1 for inverting direction
      angle: (direction),
      alignment: Alignment.center,
      child: Center(
        child: CustomPaint(
          size: const Size(50, 50),
          painter: DrawTriangleShape(),
        ),
      ),
    );
  }
}

class DrawTriangleShape extends CustomPainter {
  var painter = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, size.height * -1.8); // For Top point
    path.lineTo(0, size.height * -1); // For Bottom right point
    path.lineTo(size.width, size.height * -1); // For Bottom left point
    // path.lineTo(size.height, size.width); // For Bottom left point
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
