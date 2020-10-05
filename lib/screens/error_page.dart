import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoColors.systemBackground,
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoColors.systemBackground,
        middle: Text("Error"),
        border: null,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "404",
              style:
                  c.CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            Text("Page you are looking for, does not exist"),
          ],
        ),
      ),
    );
  }
}
