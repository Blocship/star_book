import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  c.Text(
                      'Greetings',
                      style: TextStyle(
                          color: Color(0xff036bfc),
                          fontSize: 32.5,
                          fontWeight: c.FontWeight.w500
                      )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 27.5,
                          fontWeight: c.FontWeight.w500
                      )
                  )
                ],
              ),
              Container(
                decoration: c.BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                  ),
                  borderRadius: c.BorderRadius.all(Radius.circular(15.5)),
                ),
                child: Table(
                  border: TableBorder.symmetric(
                    inside: BorderSide(width: 1.5),
                  ),
                  defaultColumnWidth: FixedColumnWidth(120),
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  'Points',
                                  style: TextStyle(
                                      color: Color(0xff00a123),
                                      fontSize: 22.5,
                                      fontWeight: c.FontWeight.w500
                                  )
                              ),
                              Text(
                                  '30',
                                  style: TextStyle(
                                      color: Color(0xff00a123),
                                      fontSize: 20,
                                      fontWeight: c.FontWeight.w500
                                  )
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  'Streak',
                                  style: TextStyle(
                                      color: Color(0xffe32200),
                                      fontSize: 22.5,
                                      fontWeight: c.FontWeight.w500
                                  )
                              ),
                              Text(
                                  '6',
                                  style: TextStyle(
                                      color: Color(0xffe32200),
                                      fontSize: 20,
                                      fontWeight: c.FontWeight.w500
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
