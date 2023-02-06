import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MoodDoughnutChart extends StatefulWidget {
  const MoodDoughnutChart({Key? key}) : super(key: key);

  @override
  State<MoodDoughnutChart> createState() => _MoodDoughnutChartState();
}

class _MoodDoughnutChartState extends State<MoodDoughnutChart> {
  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 225,
          left: 80,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(360),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                // Text('Mood of The Month', style: ,),
                Text('45%'),
                Text('Productive'),
              ],
            ),
          ),
        ),
        PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          ringStrokeWidth: 55,
          chartRadius: 250,
          // centerText: 'Mood',
          centerTextStyle: const TextStyle(color: Colors.black),
          legendOptions: const LegendOptions(
            showLegendsInRow: true,
            legendPosition: LegendPosition.bottom,
            // legendTextStyle: TextStyle()
          ),
          chartLegendSpacing: 100,
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
          animationDuration: const Duration(milliseconds: 2000),
        )
      ],
    );
  }
}
