import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../controllers/global_setting.dart';
import '../models/global_setting.dart';
import '../styles/style.dart';
import '../utils/string.dart';

/// UserName Add Sheet Screen Widget
///
/// Input form to store Username of user in [User] table.
class UsernameAddSheet extends StatefulWidget {
  @override
  _UsernameAddSheetState createState() => _UsernameAddSheetState();
}

class _UsernameAddSheetState extends State<UsernameAddSheet> {
  TextEditingController textController;
  User user;
  final int maxLength = 20;
  int remainingChar;

  @override
  void initState() {
    super.initState();
    remainingChar = maxLength;
    textController = TextEditingController();
    textController.addListener(onTextChanged);
    user = GlobalSettingController.getuser();
    textController.text = user.name;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onTextChanged() {
    setState(() {
      remainingChar = maxLength - textController.text.length;
      user.name = textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.tertiarySystemBackground,
        context,
      ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Spacer(flex: 24),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Hello there!',
                style: Style.extraLargeTitle(context),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'So nice to meet you! What do your friends call you?',
              style: Style.subTitle(context),
            ),
            Spacer(flex: 22),
            c.CupertinoTextField(
              maxLength: maxLength,
              controller: textController,
              placeholder: 'Your Name',
              keyboardType: TextInputType.text,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: c.CupertinoDynamicColor.resolve(
                  c.CupertinoColors.tertiarySystemFill,
                  context,
                ),
              ),
            ),
            c.Container(
              padding: EdgeInsets.only(top: 5),
              alignment: Alignment.centerRight,
              child: Text(
                '${textController.text.length} / $maxLength',
                style: c.TextStyle(
                  color: c.CupertinoDynamicColor.resolve(
                    c.CupertinoColors.secondaryLabel,
                    context,
                  ),
                ),
              ),
            ),
            Spacer(flex: 46),
            c.CupertinoButton(
              onPressed: isNullOrEmpty(textController.text)
                  ? null
                  : () => onContinuePressed(context),
              color: c.CupertinoDynamicColor.resolve(
                  c.CupertinoColors.systemOrange, context),
              child: Text(
                'Continue',
                style: Style.buttonText(context),
              ),
            ),
            Spacer(flex: 8),
          ],
        ),
      ),
    );
  }

  void onContinuePressed(c.BuildContext context) async {
    GlobalSettingController.setUser(user);
    await Navigator.of(context).pushReplacementNamed("home");
  }
}
