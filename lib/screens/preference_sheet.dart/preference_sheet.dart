import 'dart:io';

import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:star_book/models/brightness.dart';
import 'package:star_book/screens/acknowledgement_sheet/acknowledgement_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

// Files
import '../../controllers/global_setting.dart';
import '../../routes/route_generator.dart';
import '../../services/notification_service.dart';
import '../../styles/style.dart';
import '../../utils/date.dart';
import '../../widgets/group_action_container.dart';
import '../../widgets/my_container.dart';
import '../time_picker_sheet.dart';

part 'about_developer.dart';
part 'legal.dart';
part 'data_privacy.dart';

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
  static const String route = '/preference/settings';
  @override
  PreferenceSheetState createState() => PreferenceSheetState();
}

class PreferenceSheetState extends State<PreferenceSheet> {
  BrightnessOption _selectedOption = GlobalSettingController.getBrightnessOption();
  late DateTime _reminderTime;

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
        middle: Text('StarBook'),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Padding(padding: EdgeInsets.symmetric(vertical: 18)),
              // ActionContainer(
              //   text: 'Edit Mood',
              //   icon: c.CupertinoIcons.right_chevron,
              // ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 18)),
              Container(
                padding: EdgeInsets.fromLTRB(29, 17, 0, 8),
                child: Text(
                  'SETTINGS',
                  style: Style.footerNoteSecondary(context),
                ),
              ),
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
                  RouteSettings? settings;
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
              Privacy(),
              Padding(padding: EdgeInsets.symmetric(vertical: 18)),
              Legal(),
              Padding(padding: EdgeInsets.symmetric(vertical: 18)),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'StarBook \n v1.1.1 \n \u{a9} 2021 hashirshoaeb',
                  style: Style.footerNoteSecondary(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSlidingSegmentChanged(BrightnessOption? option) {
    setState(() {
      _selectedOption = option!;
      GlobalSettingController.setbrightnessOption(_selectedOption);
      print(GlobalSettingController.getBrightnessOption().toString());
    });
  }
}

/// Preference Route Initializer initialises the Preference route.
///
/// [PreferenceSheet] initial route.
class PreferenceRouteInitializer extends StatelessWidget {
  static const String route = '/preference';
  PreferenceRouteInitializer();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'preference/settings',
      onGenerateRoute: (settings) => RouteGenerator.preferenceRoute(settings),
    );
  }
}
