import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

// Files
import '../controllers/activity.dart';
import '../models/mood.dart';
import '../styles/style.dart';
import '../utils/color.dart';

class PieChartWidget extends StatefulWidget {
  final String type;

  PieChartWidget(this.type);

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: PieChart(
        PieChartData(
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections()),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    List<PieChartSectionData> chart = [];
    ActivityController.getMonthGraph(2021, 1).forEach(
      (key, value) {
        chart.add(
          PieChartSectionData(
            color: getColor(MoodColor.values[mMoodList[key].colorCode]),
            value: value,
            title: '${mMoodList[key].label}',
            radius: 150,
            titleStyle: Style.body(context).copyWith(
              color: CupertinoColors.white,
            ),
          ),
        );
      },
    );
    return chart;
  }
}
