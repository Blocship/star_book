import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../styles/style.dart';

class UsernameAddSheet extends StatefulWidget {
  @override
  _UsernameAddSheetState createState() => _UsernameAddSheetState();
}

class _UsernameAddSheetState extends State<UsernameAddSheet> {
  TextEditingController _username;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
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
              padding: EdgeInsets.all(16),
              controller: _username,
              placeholder: 'Your Name',
              keyboardType: TextInputType.text,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: c.CupertinoDynamicColor.resolve(
                  c.CupertinoColors.tertiarySystemFill,
                  context,
                ),
              ),
            ),
            SizedBox(height: h * 0.25),
            c.CupertinoButton(
              onPressed: onContinuePressed,
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

  void onContinuePressed() {
    {
      Navigator.of(context).pushNamed("/home");
      return null;
    }
  }
}
