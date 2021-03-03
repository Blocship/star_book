part of 'profile_page.dart';

Map<AnalyticsOption, Widget> options = {
  AnalyticsOption.lastMonth: SlidingSegment('last month'),
  AnalyticsOption.days30: SlidingSegment('30 days'),
};

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
  AnalyticsOption _selectedOption;

  @override
  void initState() {
    _selectedOption = AnalyticsOption.lastMonth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      margin: c.EdgeInsets.zero,
      child: Column(
        children: [
          c.CupertinoSlidingSegmentedControl<AnalyticsOption>(
            children: options,
            groupValue: _selectedOption,
            onValueChanged: onSlidingSegmentChanged,
            backgroundColor: c.CupertinoDynamicColor.resolve(
                c.CupertinoColors.systemGrey6, context),
          ),
          MyContainer(
            child: PieChartWidget(type: _selectedOption),
          ),
        ],
      ),
    );
  }

  void onSlidingSegmentChanged(AnalyticsOption option) {
    setState(() {
      _selectedOption = option;
    });
  }
}
