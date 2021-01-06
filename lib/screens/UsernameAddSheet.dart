import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
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
    _username = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h=c.MediaQuery.of(context).size.height;
    return c.CupertinoPageScaffold(
      child: c.SingleChildScrollView(
        child: c.Padding(
          padding: const EdgeInsets.all(15.0),
          child: c.Column(
            children: [
              c.SizedBox(height:h*0.15),
              c.Align(
                alignment: c.Alignment.topLeft,
                child: c.Text('Hello there! ',
                    style: Style.veryLargeTitle(context)
                ),
              ),
              c.SizedBox(height:10.0),
              c.Text("So nice to meet you! What do your friends call you?",
                  style: Style.subTitle(context)
              ),
              c.SizedBox(height:h*0.13),
              c.CupertinoTextField(
                padding: c.EdgeInsets.all(17),
                controller: _username,
                placeholder: "Your Name",
                keyboardType: c.TextInputType.text,
                decoration: c.BoxDecoration(
                  border: c.Border.all(color: c.CupertinoDynamicColor.resolve(c.CupertinoColors.black, context)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              c.SizedBox(height:h*0.25),
              c.SizedBox(
                height: h*0.07,
                child: c.CupertinoButton(
                  onPressed: () {
                    //navigating to profile page
                  },
                  color: c.CupertinoDynamicColor.resolve(c.CupertinoColors.systemOrange, context),
                  borderRadius: c.BorderRadius.circular(20.0),
                  child: Text("Continue",style: Style.ButtonText(context)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
