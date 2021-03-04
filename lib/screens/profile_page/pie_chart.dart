part of 'profile_page.dart';

class PieChartWidget extends StatefulWidget {
  final AnalyticsOption type;
  final DateTime from;
  final DateTime to;

  PieChartWidget({this.type, this.from, this.to});

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
          sections: sections,
        ),
      ),
    );
  }

  List<PieChartSectionData> get sections {
    List<PieChartSectionData> chart = [];
    ActivityController.moodFrequency(widget.from, widget.to).forEach(
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
    int totalDays = widget.to.difference(widget.from).inDays + 1;
    int emptyDays =
        totalDays - ActivityController.rangeLength(widget.from, widget.to);
    if (chart.length == 0)
      chart.add(
        PieChartSectionData(
          color: c.CupertinoDynamicColor.resolve(
            c.CupertinoColors.systemGrey6,
            context,
          ),
          value: emptyDays.toDouble(),
          title: 'No Data..',
          radius: 150,
          titleStyle: Style.body(context).copyWith(
            color: c.CupertinoDynamicColor.resolve(
              c.CupertinoColors.secondaryLabel,
              context,
            ),
          ),
        ),
      );
    return chart;
  }
}
