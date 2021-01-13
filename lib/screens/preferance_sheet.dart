import 'dart:io';

import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:star_book/services/notification_service/notification_service.dart';
import 'package:url_launcher/url_launcher.dart';
// Files
import '../widgets/action_container.dart';
import '../widgets/my_container.dart';
import '../styles/style.dart';

enum BrightnessOption {
  light,
  dark,
  auto,
}

Map<BrightnessOption, Widget> optoins = {
  BrightnessOption.auto: SlidingSegment(c.CupertinoIcons.circle_lefthalf_fill),
  BrightnessOption.light: SlidingSegment(c.CupertinoIcons.sun_max_fill),
  BrightnessOption.dark: SlidingSegment(c.CupertinoIcons.moon_fill),
};

class SlidingSegment extends StatelessWidget {
  SlidingSegment(this.iconData);
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 17,
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
    );
  }
}

/// Preferance Sheet Screen widget displays the
/// settings option, Privacy Policy, LICENCE, Terms and Conditions etc.
class PreferanceSheet extends StatefulWidget {
  @override
  PreferenceSheetState createState() => PreferenceSheetState();
}

class PreferenceSheetState extends State<PreferanceSheet> {
  BrightnessOption _selectedOption;
  bool getNotified;
  NotificationServce _notificationServce;

  @override
  void initState() {
    _selectedOption = BrightnessOption.auto;
    _notificationServce = NotificationServce();
    getNotified = false;
    super.initState();
  }

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
        ),
      ),
    ];
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal: 16),
      child: c.SingleChildScrollView(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dark Mode', style: Style.body(context)),
                  c.CupertinoSlidingSegmentedControl<BrightnessOption>(
                    children: optoins,
                    groupValue: _selectedOption,
                    onValueChanged: onSlidingSegmentChanged,
                    backgroundColor: c.CupertinoDynamicColor.resolve(
                      c.CupertinoColors.systemGrey6,
                      context,
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            MyContainer(
              child: Row(
                children: [
                  Text("Get Notified"),
                  c.CupertinoSwitch(
                    value: getNotified,
                    onChanged: (value) async {
                      if (Platform.isIOS) {
                        if (await _notificationServce
                            .iosNotificationPermission()) {
                          if (value) {
                            await _notificationServce
                                .scheduleDailyNotification();
                          }
                        }
                      } else {
                        if (value) {
                          await _notificationServce.scheduleDailyNotification();
                        }
                      }

                      setState(() {
                        getNotified = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            ..._aboutDeveloper(context),
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            ActionContainer(
              text: 'Privacy and Terms',
              icon: c.CupertinoIcons.right_chevron,
              onTap: () async {
                String url =
                    "https://github.com/hashirshoaeb/star_book/blob/master/POLICY.md";
                try {
                  if (await canLaunch(url)) await launch(url);
                } catch (e) {
                  // print("Url Exception , ${e.toString()}");
                }
              },
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

  void onSlidingSegmentChanged(BrightnessOption option) {
    setState(() {
      _selectedOption = option;
    });
  }
}
