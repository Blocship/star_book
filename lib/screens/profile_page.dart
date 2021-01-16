import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../styles/style.dart';
import '../models/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User('Tejas');

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
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
