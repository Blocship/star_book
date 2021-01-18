import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../styles/style.dart';
import '../widgets/my_container.dart';

enum AnalyticsOption {
  monthly,
  weekly,
}

Map<AnalyticsOption, Widget> options = {
  AnalyticsOption.monthly: SlidingSegment('monthly'),
  AnalyticsOption.weekly: SlidingSegment('weekly'),
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

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  AnalyticsOption _selectedOption;

  @override
  void initState() {
    _selectedOption = AnalyticsOption.monthly;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: 300,
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
            //TODO: Replace with graph
            child: Text(
                _selectedOption == AnalyticsOption.monthly
                    ? 'monthly'
                    : 'weekly',
                style: Style.body(context)),
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
