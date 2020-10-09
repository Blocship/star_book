import 'package:flutter/widgets.dart';
import "package:flutter/cupertino.dart" as c;
// Files
import '../screens/activity_edit_sheet.dart';
import '../screens/activity_page.dart';
import '../screens/error_page.dart';
import '../screens/home_page.dart';
import '../screens/mood_sheet.dart';

class RouteGenerator {
  static Route<dynamic> mainRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return c.CupertinoPageRoute(builder: (context) => HomePage());
      case "/activity":
        return c.CupertinoPageRoute(builder: (context) => ActivityPage(args));
      default:
        return c.CupertinoPageRoute(builder: (context) => ErrorPage());
    }
  }

  static Route<dynamic> activityRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/edit":
        return c.CupertinoPageRoute(builder: (context) => ActivityEditSheet());
      case "/mood":
        return c.CupertinoPageRoute(builder: (context) => MoodSheet());
      default:
        return c.CupertinoPageRoute(builder: (context) => ErrorPage());
    }
  }
}
