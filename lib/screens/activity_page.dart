import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// TODO: display activity in cupertino style,
// added just to implement route,
// will complete it later.
class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      navigationBar: c.CupertinoNavigationBar(
        middle: Text('Activity'),
      ),
      child: SafeArea(
          bottom: false,
          child: Center(
            child: Text("Show Activity"),
          )),
    );
  }
}
