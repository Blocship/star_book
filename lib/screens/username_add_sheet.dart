import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/foundation.dart';
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
    double h = c.MediaQuery.of(context).size.height;
    return c.CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: h * 0.13),
              Align(
                alignment: Alignment.topLeft,
                child:
                    Text('Hello there! ', style: Style.veryLargeTitle(context)),
              ),
              SizedBox(height: 10.0),
              Text("So nice to meet you! What do your friends call you?",
                  style: Style.subTitle(context)),
              SizedBox(height: h * 0.12),
              c.CupertinoTextField(
                padding: c.EdgeInsets.all(17),
                controller: _username,
                placeholder: "Your Name",
                keyboardType: c.TextInputType.text,
                decoration: c.BoxDecoration(
                  border: c.Border.all(
                      color: c.CupertinoDynamicColor.resolve(c.CupertinoColors.systemOrange, context)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(height: h * 0.25),
              SizedBox(
                height: h * 0.07,
                child: c.CupertinoButton(
                  onPressed: () {
                    //navigating to profile page
                  },
                  color: c.CupertinoDynamicColor.resolve(
                      c.CupertinoColors.systemOrange, context),
                  borderRadius: c.BorderRadius.circular(20.0),
                  child: Text("Continue", style: Style.buttonText(context)),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
