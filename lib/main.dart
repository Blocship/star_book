import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import 'routes/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoApp(
      initialRoute: '/',
      title: "StarBook",
      theme: c.CupertinoThemeData(),
      onGenerateRoute: (settings) => RouteGenerator.mainRoute(settings),
    );
  }
}
