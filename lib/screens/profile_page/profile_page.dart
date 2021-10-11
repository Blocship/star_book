import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart';
import 'package:star_book/models/user.dart';
import '../../utils/date.dart';

// Files
import '../../controllers/activity.dart';
import '../../controllers/global_setting.dart';
import '../../models/mood.dart';
import '../../styles/style.dart';
import '../../utils/color.dart';
import '../../utils/enums.dart';
import '../../utils/string.dart';
import '../../widgets/dialog.dart';
import '../../widgets/my_container.dart';

part 'analytics.dart';
part 'greeting.dart';
part 'pie_chart.dart';
part 'preference_button.dart';
part 'stats.dart';
part 'username.dart';

/// Profile Page displays user details
/// Such as
/// - [Greeting]
/// - [Username]
/// - [Stats]
/// - [Analytics]
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = GlobalSettingController.getuser();
  late bool showUsername;

  @override
  void initState() {
    super.initState();
    showUsername = true;
  }

  void onUsernameTap(bool show) {
    setState(() {
      showUsername = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: c.CupertinoDynamicColor.resolve(c.CupertinoColors.systemGrey6, context),
      // navigationBar: c.CupertinoNavigationBar(
      //   //to remove the back button that comes with the navigation bar
      //   automaticallyImplyLeading: false,
      //   brightness: brightness,
      //   backgroundColor: Color(0x00000000),
      //   trailing: PreferenceButton(),
      //   border: null,
      // ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 44,
                alignment: Alignment.centerRight,
                child: PreferenceButton(),
              ),
              Greeting(),
              SizedBox(height: 16),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 1),
                transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(scale: animation, child: child),
                child: showUsername ? Username(onTap: onUsernameTap) : UsernameEdit(onTap: onUsernameTap),
              ),
              SizedBox(height: 32),
              Stats(),
              SizedBox(height: 32),
              Text(
                'Analytics',
                style: Style.title2(context),
              ),
              SizedBox(height: 16),
              Center(child: Analytics()),
            ],
          ),
        ),
      ),
    );
  }
}
