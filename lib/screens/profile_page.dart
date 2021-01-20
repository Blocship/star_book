import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../models/global_setting.dart';
import '../styles/style.dart';
import '../controllers/global_setting.dart';
import '../widgets/analytics.dart';

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
      navigationBar: c.CupertinoNavigationBar(
        automaticallyImplyLeading:
            false, //to remove the back button that comes with the navigation bar
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
