import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MoodDoughnutChart extends StatefulWidget {
  final String percentage;
  final String mood;
  final Map<String, double> moodDataMap;
  const MoodDoughnutChart({
    Key? key,
    required this.percentage,
    required this.mood,
    required this.moodDataMap,
  }) : super(key: key);

  @override
  State<MoodDoughnutChart> createState() => _MoodDoughnutChartState();
}

class _MoodDoughnutChartState extends State<MoodDoughnutChart>
    with SingleTickerProviderStateMixin {
  // final dataMap = <String, double>{
  //   "Productive": 4,
  //   "Sad": 1,
  //   "Angry": 1,
  //   "Happy": 1,
  //   "Sick": 1,
  // };

  // late AnimationController animationController;
  // @override
  // void initState() {
  //   animationController =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 2))
  //         ..repeat();
  //   super.initState();
  // }

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
                    '${widget.percentage}%',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.mood,
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
            dataMap: widget.moodDataMap,
            colorList: const [
              Color(0xFFFFC169),
              Color(0xFF6C71FF),
              Color(0xFF60ABFF),
              Color(0xFF8EFFA4),
              Color(0xFFFF716C),
            ],
            chartType: ChartType.ring,
            ringStrokeWidth: 55,
            chartRadius: 250,
            legendOptions: const LegendOptions(
              showLegends: false,
            ),
            chartValuesOptions:
                const ChartValuesOptions(showChartValues: false),
            animationDuration: const Duration(milliseconds: 2000),
          ),
          // Positioned(
          //   top: 386,
          //   left: animationController.value,
          //   child: AnimatedBuilder(
          //     animation: animationController,
          //     builder: (BuildContext context, Widget? child) {
          //       return Transform.rotate(
          //         angle: animationController.value * 2 * math.pi,
          //         child: CustomPaint(
          //           size: const Size(30, 30),
          //           painter: ArrowIndicator(),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

class ArrowIndicator extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
