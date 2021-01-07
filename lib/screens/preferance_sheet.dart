import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
// Files
import '../widgets/action_container.dart';
import '../widgets/my_container.dart';
import '../styles/style.dart';

/// Preferance Sheet Screen widget displays the
/// settings option, Privacy Policy, LICENCE, Terms and Conditions etc.
class PreferanceSheet extends StatefulWidget {
  // theme mode
  String _selectedMode = 'Dark';

  @override
  PreferenceSheetState createState() => PreferenceSheetState();
}

class PreferenceSheetState extends State<PreferanceSheet> {
  c.CupertinoNavigationBar _buildNavBar(BuildContext context) {
    return c.CupertinoNavigationBar(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      middle: Text("StarBook"),
      leading: Container(),
      // leading: GestureDetector(
      //   onTap: () => {
      //     Navigator.maybePop(context),
      //   },
      //   child: c.Padding(
      //     padding: const EdgeInsets.only(
      //       top: 12.0,
      //       bottom: 12.0,
      //     ),
      //     child: Text(
      //       "Back",
      //       style: c.CupertinoTheme.of(context).textTheme.navActionTextStyle,
      //     ),
      //   ),
      // ),
      trailing: null,
      border: null,
    );
  }

  List<Widget> _aboutDeveloper(BuildContext context) {
    double _textWidth = MediaQuery.of(context).size.width * 0.6 - 29;
    double _imageWidth = MediaQuery.of(context).size.width * 0.4 - 29;
    return [
      Container(
        padding: EdgeInsets.fromLTRB(29, 17, 0, 8),
        child: Text(
          "ABOUT THE DEVELOPER",
          style: Style.footerNoteSecondary(context),
        ),
      ),
      MyContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _textWidth,
                child: Text(
                  "I'm Hashir, the developer of this app. Feel free to contact me anytime. I love hearing from you",
                  style: Style.body(context),
                ),
              ),
              Container(
                width: _imageWidth,
                height: _imageWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_imageWidth / 2),
                  image: DecorationImage(
                    image: AssetImage("dev-profile.jpeg"),
                  ),
                ),
              ),
            ],
          ))
    ];
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          // ActionContainer(
          //   text: 'Edit Mood',
          //   icon: c.CupertinoIcons.right_chevron,
          // ),
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          MyContainer(
            child: Row(
              mainAxisAlignment: c.MainAxisAlignment.start,
              children: [
                c.Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.white10,
                    child: Icon(Icons.bedtime, color: Colors.white70, size: 20),
                  ),
                ),
                c.SizedBox(width: 10),
                c.Expanded(
                  flex: 3,
                  child: c.Container(
                    width: MediaQuery.of(context).size.width * 0.6 - 29,
                    child: Text('Dark Mode'.toUpperCase(),
                        style: Style.body(context)
                    ),
                  ),
                ),
                c.Expanded(
                  flex: 4,
                  child: c.CupertinoSlidingSegmentedControl(
                    children: {
                      'Auto': Container(
                        width: 40,
                        height: 40,
                        child: Card(
                          elevation: 0,
                          color: widget._selectedMode == 'Auto' ? Colors.grey : Colors.transparent,
                          shape: c.RoundedRectangleBorder(
                            borderRadius: c.BorderRadius.circular(8),
                          ),
                          // margin: EdgeInsets.all(10),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: c.BoxDecoration(
                              color: Colors.white70,
                              borderRadius: c.BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(5),
                            alignment: c.Alignment.center,
                            child: Text('A', style: c.TextStyle(color: Colors.black45, fontSize: 15, fontWeight: c.FontWeight.w600)),
                          ),
                        ),
                      ),
                      'Light': Container(
                        width: 40,
                        height: 40,
                        child: Card(
                          elevation: 0,
                          color: widget._selectedMode == 'Light' ? Colors.grey : Colors.transparent,
                          shape: c.RoundedRectangleBorder(
                            borderRadius: c.BorderRadius.circular(8),
                          ),
                          // margin: EdgeInsets.all(10),
                          child: Icon(Icons.wb_sunny, color: Colors.white70, size: 20),
                        ),
                      ),
                      'Dark': Container(
                        width: 40,
                        height: 40,
                        child: Card(
                          elevation: 0,
                          color: widget._selectedMode == 'Dark' ? Colors.grey : Colors.transparent,
                          shape: c.RoundedRectangleBorder(
                            borderRadius: c.BorderRadius.circular(8),
                          ),
                          // margin: EdgeInsets.all(10),
                          child: Icon(Icons.bedtime, color: Colors.white70, size: 20),
                        ),
                      ),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        widget._selectedMode = value;
                        print(widget._selectedMode);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ..._aboutDeveloper(context),
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ActionContainer(
            text: 'Privacy and Terms',
            icon: c.CupertinoIcons.right_chevron,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ActionContainer(
            text: 'LICENCE',
            icon: c.CupertinoIcons.right_chevron,
            onTap: () async {
              String url =
                  "https://github.com/hashirshoaeb/star_book/blob/master/LICENSE";
              try {
                if (await canLaunch(url)) await launch(url);
              } catch (e) {
                // print("Url Exception , ${e.toString()}");
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      navigationBar: _buildNavBar(context),
      child: _buildBody(context),
    );
  }
}
