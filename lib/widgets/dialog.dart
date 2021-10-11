import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

/// Alert Dialog Widget displays Cupertino style AlertDialog.
class AlertDialog extends StatelessWidget {
  final String title;
  final String content;

  const AlertDialog({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return c.CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        c.CupertinoDialogAction(
          child: const Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
