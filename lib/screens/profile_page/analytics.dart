part of 'profile_page.dart';

class SlidingSegment extends StatelessWidget {
  final String optionValue;

  SlidingSegment(this.optionValue);

  @override
  Widget build(BuildContext context) {
    return Text(
      optionValue,
      style: Style.body(context),
    );
  }
}

/// Analytics widget displays graph of user's last month/week activtiy
class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  AnalyticsOption selectedOption;
  DateTime selectedfrom;
  DateTime selectedto;

  @override
  void initState() {
    super.initState();
    selectedOption = AnalyticsOption.lastMonth;
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          c.CupertinoSlidingSegmentedControl<AnalyticsOption>(
            children: options,
            groupValue: selectedOption,
            onValueChanged: onSlidingSegmentChanged,
            backgroundColor: c.CupertinoDynamicColor.resolve(
                c.CupertinoColors.systemGrey6, context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${getDateFormat(from)} - ${getDateFormat(to)}',
              style: Style.bodySecondary(context),
            ),
          ),
          MyContainer(
            child: PieChartWidget(from: from, to: to),
          ),
        ],
      ),
    );
  }

  Map<AnalyticsOption, Widget> get options => {
        AnalyticsOption.lastMonth: SlidingSegment('last month'),
        AnalyticsOption.days30: SlidingSegment('30 days'),
      };

  DateTime get to {
    DateTime currentDate = DateTime.now();
    int lastYear = getPreviousYear(currentDate.month, currentDate.year);
    int lastMonth = getPreviousMonth(currentDate.month, currentDate.year);
    int totalDays = getDaysInMonth(lastYear, lastMonth);
    switch (selectedOption) {
      case AnalyticsOption.lastMonth:
        return DateTime(lastYear, lastMonth, totalDays);
      case AnalyticsOption.days30:
        return DateTime.now();
      default:
        return DateTime.now();
    }
  }

  DateTime get from {
    DateTime currentDate = DateTime.now();
    int lastYear = getPreviousYear(currentDate.month, currentDate.year);
    int lastMonth = getPreviousMonth(currentDate.month, currentDate.year);

    switch (selectedOption) {
      case AnalyticsOption.lastMonth:
        return DateTime(lastYear, lastMonth, 1);
      case AnalyticsOption.days30:
        DateTime back30day = DateTime(
          lastYear,
          lastMonth,
          currentDate.day,
        );
        return back30day;
      default:
        return DateTime.now();
    }
  }

  void onSlidingSegmentChanged(AnalyticsOption option) {
    setState(() {
      selectedOption = option;
      selectedto = to;
      selectedfrom = from;
    });
  }
}
