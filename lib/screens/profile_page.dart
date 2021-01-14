import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../styles/style.dart';
import '../widgets/my_container.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              c.Text(
                  'Greetings',
                  style: Style.extraLargeTitle(context)
              ),
              Text(
                  'Tejas',
                  style: Style.subTitle(context).copyWith(
                    color: c.CupertinoDynamicColor.resolve(
                      c.CupertinoColors.systemBlue.darkColor,
                      context,
                    ),
                    fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  c.Container(
                    padding: EdgeInsets.symmetric(horizontal: 25 , vertical: 7.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15) , bottomLeft: Radius.circular(15)),
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
                                fontWeight: c.FontWeight.w500
                            )
                        ),
                        Text(
                            '30',
                            style: TextStyle(
                                color: c.CupertinoColors.white,
                                fontSize: 17,
                                fontFamily: "SFProText",
                                fontWeight: c.FontWeight.w500
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 1.5,),
                  c.Container(
                    padding: EdgeInsets.symmetric(horizontal: 25 , vertical: 7.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15) , bottomRight: Radius.circular(15)),
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
                                fontWeight: c.FontWeight.w500
                            )
                        ),
                        Text(
                            '6',
                            style: TextStyle(
                                color: c.CupertinoColors.white,
                                fontSize: 17,
                                fontFamily: "SFProText",
                                fontWeight: c.FontWeight.w500
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}

// Table(
// defaultColumnWidth: FixedColumnWidth(120),
// children: [
// TableRow(
// decoration: BoxDecoration(
// color: Color(0xff0373fc),
// ),
// children: [
// Padding(
// padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
// ),
// Padding(
// padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
// )
// ],
// )
// ],
// ),