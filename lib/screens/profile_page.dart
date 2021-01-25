import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

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
  User user;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await openHiveBox();
    });
    user = GlobalSettingController.getuser();
    super.initState();
  }

  /// Opening the [globalSettingBoxName] box if it isn't
  /// already opened.
  Future<void> openHiveBox() async {
    if (!Hive.isBoxOpen(globalSettingBoxName)) {
      await Hive.openBox(globalSettingBoxName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
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
            SizedBox(height: 30),
            Text(
              'Greetings',
              style: Style.extraLargeTitle(context),
            ),
            SizedBox(height: 10),
            Text(
              user.name,
              style: Style.largeTitle(context).copyWith(
                color: c.CupertinoDynamicColor.resolve(
                  c.CupertinoColors.systemBlue.darkColor,
                  context,
                ),
              ),
            ),
            SizedBox(height: 40),
            Stats(),
            Center(child: Analytics())
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: c.CupertinoDynamicColor.resolve(
              c.CupertinoColors.systemBlue.darkColor,
              context,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Points',
                style: TextStyle(
                    color: c.CupertinoColors.white,
                    fontSize: 20,
                    fontFamily: "SFProText",
                    fontWeight: c.FontWeight.w500),
              ),
              Text(
                '30',
                style: TextStyle(
                    color: c.CupertinoColors.white,
                    fontSize: 17,
                    fontFamily: "SFProText",
                    fontWeight: c.FontWeight.w500),
              )
            ],
          ),
        ),
        SizedBox(width: 1.5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: c.CupertinoDynamicColor.resolve(
              c.CupertinoColors.systemBlue.darkColor,
              context,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Streak',
                style: TextStyle(
                    color: c.CupertinoColors.white,
                    fontSize: 20,
                    fontFamily: "SFProText",
                    fontWeight: c.FontWeight.w500),
              ),
              Text(
                '6',
                style: TextStyle(
                    color: c.CupertinoColors.white,
                    fontSize: 17,
                    fontFamily: "SFProText",
                    fontWeight: c.FontWeight.w500),
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
