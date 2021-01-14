import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

//Files
import '../styles/style.dart';
import '../widgets/dialog.dart';

/// UserName Add Sheet Screen Widget
///
/// Input form to store Username of user in [User] table.
class UsernameAddSheet extends StatefulWidget {
  @override
  _UsernameAddSheetState createState() => _UsernameAddSheetState();
}

class _UsernameAddSheetState extends State<UsernameAddSheet> {
  TextEditingController _username;
  String error;
  int length = 0;
  String text = "";
  int maxLength = 20;

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
      child: c.Builder(
        builder: (context) => SafeArea(
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
                maxLength: 20,
                onChanged: (String newVal) {
                  if (newVal.length <= maxLength) {
                    text = newVal;
                    setState(() {
                      length = newVal.length;
                    });
                  } else {
                    _username.text = text;
                  }
                },
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
              c.Container(
                padding: EdgeInsets.only(top: 5),
                alignment: c.Alignment.centerRight,
                child: Text(
                  '$length/$maxLength',
                  style: c.TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              SizedBox(height: h * 0.25),
              c.CupertinoButton(
                onPressed: _username.text == null ||
                        _username.text.length == 0 ||
                        _username.text.length > 20
                    ? null
                    : () {
                        onContinuePressed(context);
                      },
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
      ),
    );
  }

  /// Function to validate Name and display Cupertino Alert Dialog Box in case of any validation error.
  Future<bool> validate(c.BuildContext context) async {
    if (_username.text == null || _username.text.length == 0) {
      setState(() {
        error = "Please Enter your Username";
      });
      await c.showCupertinoDialog(
        context: context,
        builder: (_) {
          return AlertDialog(title: 'Name', content: error);
        },
      );
      return false;
    } else if (_username.text.length > 20) {
      setState(() {
        error = "Your name should be less than 20 Characters";
      });
      await c.showCupertinoDialog(
        context: context,
        builder: (_) {
          return AlertDialog(title: 'Name', content: error);
        },
      );
      return false;
    } else {
      return true;
    }
  }

  /// Function to push to Navigator to home screen.
  void pushToHome() {
    Navigator.of(context).pushReplacementNamed("/home");
  }

  void onContinuePressed(c.BuildContext context) async {
    // dynamic isValid = validate(context);
    // bool nameValidOrNot = await isValid;
    // if (nameValidOrNot) {
    //   pushToHome();
    // }
    pushToHome();
  }
}
