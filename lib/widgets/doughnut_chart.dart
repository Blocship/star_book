import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MoodDoughnutChart extends StatefulWidget {
  const MoodDoughnutChart({Key? key}) : super(key: key);

  @override
  State<MoodDoughnutChart> createState() => _MoodDoughnutChartState();
}

class _MoodDoughnutChartState extends State<MoodDoughnutChart> {
  final dataMap = <String, double>{
    "Productive": 5,
    "Sad": 3,
    "Angry": 2,
    "Happy": 2,
    "": 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 286,
            left: 80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(360),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mood of The Month',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Text(
                    '45%',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Productive',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1F1F1F),
                        ),
                  ),
                ],
              ),
            ),
          ),
          PieChart(
            dataMap: dataMap,
            chartType: ChartType.ring,
            ringStrokeWidth: 55,
            chartRadius: 250,
            legendOptions: const LegendOptions(
              showLegends: false,
              // showLegendsInRow: true,
              // legendPosition: LegendPosition.bottom,
              // legendTextStyle: TextStyle()
            ),
            chartLegendSpacing: 100,
            chartValuesOptions:
                const ChartValuesOptions(showChartValues: false),
            animationDuration: const Duration(milliseconds: 2000),
          )
        ],
      ),
    );
  }
}
