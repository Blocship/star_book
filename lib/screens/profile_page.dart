import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../controllers/global_setting.dart';
import '../models/global_setting.dart';
import '../styles/style.dart';
import '../widgets/my_container.dart';

/// Profile Page displays user details
/// Such as
/// - Username
/// - Points
/// - Streak
/// - Monthly and Weekly Widgets.

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /// Initiate user from Global Settings Controller
  User user = GlobalSettingController.getuser();

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      navigationBar: c.CupertinoNavigationBar(
        //to remove the back button that comes with the navigation bar
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x00000000),
        trailing: PreferanceButton(),
        border: null,
      ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Greetings',
              style: Style.largeTitle(context),
            ),
            SizedBox(height: 17),
            Text(user.name, style: Style.subTitleBold(context)),
            SizedBox(height: 17),
            Stats(),
            SizedBox(height: 17),
            Text(
              'Analytics',
              style: Style.subTitleBold(context),
            ),
            SizedBox(height: 17),
            Analytics()
          ],
        ),
      ),
    );
  }
}

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: c.MainAxisAlignment.spaceBetween,
        children: [
          MyContainer(
            width: c.MediaQuery.of(context).size.width / 2.5,
            margin: c.EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: c.CrossAxisAlignment.start,
              children: [
                Text(
                  '30',
                  style: Style.subTitleBold(context),
                ),
                Text(
                  'Points',
                  style: Style.bodySecondary(context),
                )
              ],
            ),
          ),

          MyContainer(
            margin: c.EdgeInsets.zero,
            width: c.MediaQuery.of(context).size.width / 2.5,
            child: Column(
              crossAxisAlignment: c.CrossAxisAlignment.start,
              children: [
                Text(
                  '6',
                  style: Style.subTitleBold(context),
                ),
                Text(
                  'Streak',
                  style: Style.bodySecondary(context),
                )
              ],
            ),
          ),
        ],
      );
  }
}

class PreferanceButton extends StatelessWidget {
  void onTap(context) {
    Navigator.of(context).pushNamed("/preferance");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Icon(
        c.CupertinoIcons.bars,
        color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.label,
          context,
        ),
      ),
    );
  }
}

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
      margin: c.EdgeInsets.zero,
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
