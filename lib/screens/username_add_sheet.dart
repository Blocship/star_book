import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

//Files
import '../styles/style.dart';

class UsernameAddSheet extends StatefulWidget {
  @override
  _UsernameAddSheetState createState() => _UsernameAddSheetState();
}

class _UsernameAddSheetState extends State<UsernameAddSheet> {
  double size = 150.0;
  TextEditingController _username;

  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        // Add state updating code
        setState(() {
          size = visible ? 0 : 150;
        });
      },
    );
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
    double w = MediaQuery.of(context).size.width;
    return c.CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.tertiarySystemBackground,
        context,
      ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            AnimatedContainer(
              curve: Curves.easeOut,
              duration: Duration(
                milliseconds: 400,
              ),
              width: w * 0.8,
              height: size,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    // fit: BoxFit.fitHeight,
                      image: AssetImage("welcome.gif"))),
            ),
            SizedBox(height: 25.0),
            Text(
              'So nice to meet you! What do your friends call you?',
              style: Style.subTitle(context),
            ),
            SizedBox(height: 30.0),
            c.CupertinoTextField(
              padding: EdgeInsets.all(23),
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
            SizedBox(height: h * 0.3),
            SizedBox(
              height: h * 0.085,
              width: w * 0.6,
              child: c.CupertinoButton(
                disabledColor: c.CupertinoDynamicColor.resolve(
                    c.CupertinoColors.systemOrange.withOpacity(0.3), context),
                borderRadius: BorderRadius.circular(15.0),
                onPressed: _username.text.isEmpty ? null :onContinuePressed,
                color: c.CupertinoDynamicColor.resolve(
                    c.CupertinoColors.systemOrange, context),
                child: Text(
                  'Continue',
                  style: Style.buttonText(context),
                ),
              ),
            ),
            SizedBox(height:15.0),
            Text("Animation by Natalia Świerz on Lottie Files",style: Style.footerNoteSecondary(
                context),)
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
