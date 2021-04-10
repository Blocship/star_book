import 'dart:io';

import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:star_book/services/notification_service.dart';
import 'package:star_book/utils/date.dart';
import 'package:url_launcher/url_launcher.dart';

// Files
import '../../models/global_setting.dart';
import '../time_picker_sheet.dart';
import '../../styles/style.dart';
import '../../widgets/action_container.dart';
import '../../widgets/my_container.dart';
import '../../controllers/global_setting.dart';

part 'about_developer.dart';

Map<BrightnessOption, Widget> options = {
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

/// Preference Sheet Screen widget displays the
/// settings option, Privacy Policy, LICENCE, Terms and Conditions etc.
class PreferenceSheet extends StatefulWidget {
  @override
  PreferenceSheetState createState() => PreferenceSheetState();
}

class PreferenceSheetState extends State<PreferenceSheet> {
  BrightnessOption _selectedOption = GlobalSettingController.getBrightnessOption();
  DateTime _reminderTime;

  @override
  void initState() {
    _reminderTime = GlobalSettingController.getReminderTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemGrey6,
        context,
      ),
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6,
          context,
        ),
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
      ),
      child: SafeArea(
        // minimum: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            // ActionContainer(
            //   text: 'Edit Mood',
            //   icon: c.CupertinoIcons.right_chevron,
            // ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 18)),
            MyContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: Style.body(context),
                  ),
                  c.CupertinoSlidingSegmentedControl<BrightnessOption>(
                    children: options,
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
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            MyContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reminder',
                    style: Style.body(context),
                  ),
                  c.Row(
                    children: [
                      Text(
                        '${getTimeFormat(context, _reminderTime)}',
                        style: Style.bodySecondary(context),
                      ),
                      Icon(
                        c.CupertinoIcons.right_chevron,
                        color: c.CupertinoDynamicColor.resolve(
                          c.CupertinoColors.tertiaryLabel,
                          context,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () async {
                RouteSettings settings;
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => TimePickerSheet(settings),
                //   ),
                // );
                if (Platform.isIOS) {
                  await NotificationService().iosNotificationPermission();
                }
                DateTime _selectedTime = await c.showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return TimePickerSheet(settings);
                    });
                if (_selectedTime != null) {
                  setState(() {
                    _reminderTime = _selectedTime;
                  });
                }
              },
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            AboutDeveloper(),
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            ActionContainer(
              text: 'Privacy and Terms',
              icon: c.CupertinoIcons.right_chevron,
              onTap: () async {
                String url = "https://github.com/hashirshoaeb/star_book/blob/master/PRIVACY%26POLICY.md";
                try {
                  if (await canLaunch(url)) await launch(url);
                } catch (e) {
                  // print("Url Exception , ${e.toString()}");
                }
              },
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            ActionContainer(
              text: 'LICENCE',
              icon: c.CupertinoIcons.right_chevron,
              onTap: () async {
                String url = "https://github.com/hashirshoaeb/star_book/blob/master/LICENSE";
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

  void onSlidingSegmentChanged(BrightnessOption option) {
    setState(() {
      _selectedOption = option;
      GlobalSettingController.setbrightnessOption(_selectedOption);
      print(GlobalSettingController.getBrightnessOption().toString());
    });
  }
}
