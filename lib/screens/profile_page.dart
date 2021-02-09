import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../controllers/global_setting.dart';
import '../models/global_setting.dart';
import '../styles/style.dart';
import '../widgets/my_container.dart';
import '../controllers/activity.dart';
import '../utils/string.dart';
import '../widgets/dialog.dart';

/// Profile Page displays user details
/// Such as
/// - Username
/// - Points
/// - Streak
/// - Monthly and Weekly Graph Widgets.

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /// Initiate user from Global Settings Controller
  User user = GlobalSettingController.getuser();
  bool showUsername;

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
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      navigationBar: c.CupertinoNavigationBar(
        //to remove the back button that comes with the navigation bar
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x00000000),
        trailing: PreferanceButton(),
        border: null,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Greetings',
                style: Style.largeTitle(context),
              ),
              SizedBox(height: 16),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 1),
                transitionBuilder:
                    (Widget child, Animation<double> animation) =>
                        ScaleTransition(scale: animation, child: child),
                child: showUsername
                    ? Username(onTap: onUsernameTap)
                    : UsernameEdit(onTap: onUsernameTap),
              ),
              SizedBox(height: 32),
              Stats(),
              SizedBox(height: 32),
              Text(
                'Analytics',
                style: Style.title2(context),
              ),
              SizedBox(height: 16),
              Center(child: Analytics())
            ],
          ),
        ),
      ),
    );
  }
}

class PreferanceButton extends StatelessWidget {
  void onTap(context) {
    Navigator.of(context).pushNamed('/preferance');
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

class Username extends StatelessWidget {
  final Function onTap;
  final User user = GlobalSettingController.getuser();

  Username({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onTap(false),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(user.name, style: Style.title(context)),
      ),
    );
  }
}

class UsernameEdit extends StatefulWidget {
  final Function onTap;

  UsernameEdit({this.onTap});

  @override
  _UsernameEditState createState() => _UsernameEditState();
}

class _UsernameEditState extends State<UsernameEdit> {
  final int maxLength = 20;
  int remainingCharacters;
  TextEditingController textController;
  User user;

  @override
  void initState() {
    super.initState();
    textController = new TextEditingController();
    user = GlobalSettingController.getuser();
    textController.text = user.name;
    textController.addListener(onTextChanged);
    remainingCharacters = maxLength - textController.text.length;
  }

  void onTextChanged() {
    setState(() {
      remainingCharacters = maxLength - textController.text.length;
      user.name = textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 11,
          child: c.CupertinoTextField(
            maxLength: maxLength,
            controller: textController,
            keyboardType: TextInputType.text,
            padding: EdgeInsets.all(16),
            style: Style.bodySecondary(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: c.CupertinoDynamicColor.resolve(
                  c.CupertinoColors.quaternarySystemFill, context),
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 44,
          height: 44,
          child: c.CupertinoButton(
            padding: EdgeInsets.all(10),
            color: c.CupertinoDynamicColor.resolve(
                c.CupertinoColors.systemOrange, context),
            child: Icon(c.CupertinoIcons.checkmark_alt,
                color: c.CupertinoColors.white),
            onPressed: () {
              if (isNullOrEmpty(textController.text)) {
                AlertDialog dialog = AlertDialog(
                    title: "Username can't be empty",
                    content: "Please enter your username");
                c.showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => dialog);
              } else {
                GlobalSettingController.setUser(user);
                this.widget.onTap(true);
              }
            },
          ),
        ),
      ],
    );
  }
}

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: c.MainAxisAlignment.spaceAround,
      children: [
        MyContainer(
          width: MediaQuery.of(context).size.width / 2 - 32,
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: c.CrossAxisAlignment.start,
            children: [
              Text(
                ActivityController.points().toString(),
                style: Style.title(context),
              ),
              SizedBox(height: 6),
              Text(
                'Points',
                style: Style.bodySecondary(context),
              )
            ],
          ),
        ),
        MyContainer(
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width / 2 - 32,
          child: Column(
            crossAxisAlignment: c.CrossAxisAlignment.start,
            children: [
              Text(
                ActivityController.streak().toString(),
                style: Style.title(context),
              ),
              SizedBox(height: 6),
              Text(
                'Streak',
                style: Style.bodySecondary(context),
              )
            ],
          ),
        ),
      ],
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
      margin: c.EdgeInsets.zero,
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
