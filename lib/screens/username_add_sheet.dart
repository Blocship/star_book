import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
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
  TextEditingController _username;
  final int maxLength = 20;
  int remainingChar;

  @override
  void initState() {
    super.initState();
    remainingChar = maxLength;
    _username = TextEditingController();
    _username.addListener(onTextChanged);
  }

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  void onTextChanged() {
    setState(() {
      remainingChar = maxLength - _username.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
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
            SizedBox(height: h * 0.13),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Hello there!',
                style: Style.extraLargeTitle(context),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'So nice to meet you! What do your friends call you?',
              style: Style.subTitle(context),
            ),
            SizedBox(height: h * 0.12),
            c.CupertinoTextField(
              maxLength: maxLength,
              controller: _username,
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
                '${_username.text.length} / $maxLength',
                style: c.TextStyle(
                  color: c.CupertinoDynamicColor.resolve(
                    c.CupertinoColors.secondaryLabel,
                    context,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.25),
            c.CupertinoButton(
              onPressed: isNullOrEmpty(_username.text)
                  ? null
                  : () => onContinuePressed(context),
              color: c.CupertinoDynamicColor.resolve(
                  c.CupertinoColors.systemOrange, context),
              child: Text(
                'Continue',
                style: Style.buttonText(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onContinuePressed(c.BuildContext context) async {
    await Navigator.of(context).pushNamed("/home");
  }
}
