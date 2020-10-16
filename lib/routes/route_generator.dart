import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
        return MaterialWithModalsPageRoute(builder: (context) => HomePage());
      case "/activity":
        return MaterialWithModalsPageRoute(
            builder: (context) => ActivityPage(args));
      default:
        return MaterialWithModalsPageRoute(builder: (context) => ErrorPage());
    }
  }

  static Route<dynamic> activityRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/edit":
        return MaterialWithModalsPageRoute(
            builder: (context) => ActivityEditSheet());
      case "/mood":
        return MaterialWithModalsPageRoute(builder: (context) => MoodSheet());
      default:
        return MaterialWithModalsPageRoute(builder: (context) => ErrorPage());
    }
  }
}
