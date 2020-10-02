import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoApp(
      home: HomePage(),
      title: "StarBook",
      theme: c.CupertinoThemeData(),
    );
  }
}
