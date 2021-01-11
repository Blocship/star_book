import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:star_book/screens/year_page.dart';

// Files
import '../screens/activity_edit_sheet.dart';
import '../screens/activity_page.dart';
import '../screens/error_page.dart';
import '../screens/home_page.dart';
import '../screens/mood_sheet.dart';
import '../screens/preferance_sheet.dart';
import '../utils/bottom_sheet.dart';
import '../screens/username_add_sheet.dart';

/// Centralised routing class.
/// Static methods inside, define named routes
class RouteGenerator {
  static Route<dynamic> mainRoute(
    RouteSettings settings,
  ) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialWithModalsPageRoute(
          builder: (context) => UsernameAddSheet(),
        );
      case "/home":
        return MaterialWithModalsPageRoute(
          builder: (context) => HomePage(),
        );
      case "/activity":
        return MaterialWithModalsPageRoute(
          builder: (context) => ActivityPage(args),
        );
      case "/year":
        return MaterialWithModalsPageRoute(
          builder: (context) => YearPage(
            startYear: DateTime.now().subtract(new Duration(days: 5*365)),
            endYear: DateTime.now(),
          ),
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
        return MaterialWithModalsPageRoute(
          builder: (context) => ErrorPage(),
        );
    }
  }

  static Route<dynamic> activityRoute(
    RouteSettings settings,
    dynamic activity,
  ) {
    // final args = settings.arguments;
    switch (settings.name) {
      case "edit/title":
        return MaterialWithModalsPageRoute(
          builder: (context) => ActivityEditSheet(activity),
        );
      case "edit/mood":
        return MaterialWithModalsPageRoute(
          builder: (context) => MoodSheet(),
        );
      default:
        return MaterialWithModalsPageRoute(
          builder: (context) => ErrorPage(),
        );
    }
  }
}
