import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

class AlertDialog extends StatelessWidget {
  final String title;
  final String content;

  AlertDialog({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return c.CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        c.CupertinoDialogAction(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
