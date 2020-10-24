import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as c;
// Files
import '../screens/activity_edit_sheet.dart';
import '../screens/activity_page.dart';
import '../screens/error_page.dart';
import '../screens/home_page.dart';
import '../screens/mood_sheet.dart';
import '../screens/preferance_sheet.dart';
import '../utils/bottom_sheet.dart';

/// Centralised routing class.
/// Static methods inside, define named routes
class RouteGenerator {
  static Route<dynamic> mainRoute(
    RouteSettings settings,
  ) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return c.CupertinoPageRoute(
          builder: (context) => HomePage(),
        );
      case "/activity":
        return c.CupertinoPageRoute(
          builder: (context) => ActivityPage(args),
        );
      case "/preferance":
        return CupertinoModalBottomSheetRouteWrapper(
          builder: (context, controller) => PreferanceSheet(),
        );
      case "/edit":
        return CupertinoModalBottomSheetRouteWrapper(
          builder: (context, controller) => ActivityRouteInitializer(args),
        );
      default:
        return c.CupertinoPageRoute(
          builder: (context) => ErrorPage(),
        );
    }
  }

  static Route<dynamic> activityRoute(
    RouteSettings settings,
    dynamic activity,
  ) {
    final args = settings.arguments;
    switch (settings.name) {
      case "edit/title":
        return c.CupertinoPageRoute(
          builder: (context) => ActivityEditSheet(activity),
        );
      case "edit/mood":
        return c.CupertinoPageRoute(
          builder: (context) => MoodSheet(),
        );
      default:
        return c.CupertinoPageRoute(
          builder: (context) => ErrorPage(),
        );
    }
  }
}
