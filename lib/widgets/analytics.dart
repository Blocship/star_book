import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:star_book/styles/style.dart';
import 'package:star_book/widgets/my_container.dart';

enum AnalyticsOptions{
  monthly,
  weekly
}

Map<AnalyticsOptions, Widget> options = {
  AnalyticsOptions.monthly: SlidingSegment('monthly'),
  AnalyticsOptions.weekly: SlidingSegment('weekly')
};

class SlidingSegment extends StatelessWidget {
  final optionValue;
  SlidingSegment(this.optionValue);
  @override
  Widget build(BuildContext context) {
    return Text(
      optionValue,
      style: Style.body(context),
    );
  }
}

class AnalyticsWidget extends StatefulWidget {
  @override
  AnalyticsWidgetState createState() => AnalyticsWidgetState();
}

class AnalyticsWidgetState extends State<AnalyticsWidget> {
  AnalyticsOptions _analyticsOptions;

  @override
  void initState() {
    _analyticsOptions = AnalyticsOptions.monthly;
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          MyContainer(
            child: Column(
              children: [
                MyContainer(
                  child: c.CupertinoSlidingSegmentedControl<AnalyticsOptions>(
                    children: options,
                    groupValue: _analyticsOptions,
                    onValueChanged: onSlidingSegmentChanged,
                    backgroundColor: c.CupertinoDynamicColor.resolve(
                        c.CupertinoColors.systemGrey6,
                        context),
                  ),
                ),
                MyContainer(
                  child: Text( _analyticsOptions == AnalyticsOptions.monthly ? 'monthly' : 'weekly',
                      style: Style.body(context)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6,
          context),
      child: _buildBody(context),
    );
  }

  void onSlidingSegmentChanged(AnalyticsOptions option) {
    setState(() {
      _analyticsOptions = option;
    });
  }
}
