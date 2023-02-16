import 'package:flutter/material.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChartWidget extends StatefulWidget {
  const DoughnutChartWidget({Key? key}) : super(key: key);

  @override
  State<DoughnutChartWidget> createState() => _DoughnutChartWidgetState();
}

class _DoughnutChartWidgetState extends State<DoughnutChartWidget> {
  @override
  Widget build(BuildContext context) {
    final doughnutColor = Theme.of(context).extension<DoughnutChartStyle>()!;
    final List<ChartData> chartData = [
      ChartData(x: 'Productive', y: 3.5, color: doughnutColor.primaryColor),
      ChartData(x: 'Sad', y: 1.5, color: doughnutColor.secondaryColor),
      ChartData(x: 'Angry', y: 1.5, color: doughnutColor.tertiaryColor),
      ChartData(x: 'Happy', y: 1.5, color: doughnutColor.quinaryColor),
      ChartData(x: 'Sick', y: 2.0, color: doughnutColor.quaternaryColor),
    ];
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: doughnutColor.octonaryColor,
      ),
      padding: const EdgeInsets.symmetric(
          vertical: CustomPadding.smallPadding,
          horizontal: CustomPadding.mediumPadding),
      child: SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: PhysicalModel(
              shape: BoxShape.circle,
              color:
                  Theme.of(context).extension<ThemeColorStyle>()!.quinaryColor,
            ),
          ),
          CircularChartAnnotation(
            widget: Text(
              'Mood of The\nMonth',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .secondaryColor
                        .withOpacity(0.5),
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
            radius: '90%',
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
