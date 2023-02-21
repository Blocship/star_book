import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChartWidget extends StatefulWidget {
  const DoughnutChartWidget({Key? key}) : super(key: key);

  @override
  State<DoughnutChartWidget> createState() => _DoughnutChartWidgetState();
}

class _DoughnutChartWidgetState extends State<DoughnutChartWidget> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final DoughnutChartStyle doughnutChartStyle = context.doughnutChartStyle;
    final List<ChartData> chartData = [
      ChartData(
          x: 'Productive', y: 3.5, color: doughnutChartStyle.primaryColor),
      ChartData(x: 'Sad', y: 1.5, color: doughnutChartStyle.secondaryColor),
      ChartData(x: 'Angry', y: 1.5, color: doughnutChartStyle.tertiaryColor),
      ChartData(x: 'Happy', y: 1.5, color: doughnutChartStyle.quinaryColor),
      ChartData(x: 'Sick', y: 2.0, color: doughnutChartStyle.quaternaryColor),
    ];
    return Container(
      height: deviceHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: doughnutChartStyle.octonaryColor,
        boxShadow: [
          BoxShadow(
            color: themeColorStyle.secondaryColor.withOpacity(0.1),
            blurRadius: 100,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
          vertical: CustomPadding.smallPadding,
          horizontal: CustomPadding.mediumPadding),
      child: SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: PhysicalModel(
              shape: BoxShape.circle,
              color: themeColorStyle.quinaryColor,
            ),
          ),
          CircularChartAnnotation(
            widget: Text(
              'Mood of the Month',
              textAlign: TextAlign.center,
              style: textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: themeColorStyle.secondaryColor.withOpacity(0.5),
              ),
            ),
          ),
        ],
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
            animationDuration: 0,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper: (datum, index) => chartData[index].color,
            // Radius of doughnut
            radius: '98%',
            innerRadius: '60%',
          )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData({required this.x, required this.y, required this.color});

  final String x;
  final double y;
  final Color color;
}
