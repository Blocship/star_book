part of 'profile_page.dart';

class PieChartWidget extends StatefulWidget {
  final AnalyticsOption type;

  PieChartWidget({this.type});

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
          sections: (widget.type == AnalyticsOption.monthly)
              ? monthlySections()
              : weeklySections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> monthlySections() {
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

  List<PieChartSectionData> weeklySections() {
    List<PieChartSectionData> chart = [];
    chart.add(
      PieChartSectionData(
        color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.secondarySystemBackground,
          context,
        ),
        value: 100,
        title: 'Coming Soon..',
        radius: 150,
        titleStyle: Style.body(context),
      ),
    );

    return chart;
  }
}
