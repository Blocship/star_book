import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// Files
import '../screens/activity_edit_sheet.dart';
import '../screens/activity_page.dart';
import '../screens/date_picker_sheet.dart';
import '../screens/error_page.dart';
import '../screens/home_page.dart';
import '../screens/mood_sheet.dart';
import '../screens/preferance_sheet.dart';
import '../screens/time_picker_sheet.dart';
import '../screens/username_add_sheet.dart';
import '../screens/year_page.dart';
import '../utils/bottom_sheet.dart';

/// Centralised routing class.
/// Static methods inside, define named routes
class RouteGenerator {
  static final RouteGenerator routeGeneratorSingleton =
      RouteGenerator._internal();
  RouteGenerator._internal();
  factory RouteGenerator() => routeGeneratorSingleton;

  static Route<dynamic> mainRoute(
    RouteSettings settings,
  ) {
    final args = settings.arguments;
    switch (settings.name) {
      case 'username_add':
        return MaterialWithModalsPageRoute(
          builder: (context) => UsernameAddSheet(),
        );
      case 'home':
        return MaterialWithModalsPageRoute(
          builder: (context) => Home(),
        );
      case 'activity':
        return MaterialWithModalsPageRoute(
          builder: (context) => ActivityPage(args),
        );
      case 'year':
        return MaterialWithModalsPageRoute(
          builder: (context) => YearPage(),
        );
      case 'preferance':
        return CupertinoModalBottomSheetRouteWrapper(
          builder: (context, controller) => PreferanceSheet(),
        );
      case 'edit':
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
      case 'edit/title':
        return MaterialWithModalsPageRoute(
          builder: (context) => ActivityEditSheet(activity),
        );
      case 'edit/mood':
        return MaterialWithModalsPageRoute(
          builder: (context) => MoodSheet(),
        );
      case 'edit/date':
        return MaterialWithModalsPageRoute(
          builder: (context) => DatePickerSheet(settings),
        );
      case 'edit/time':
        return MaterialWithModalsPageRoute(
          builder: (context) => TimePickerSheet(settings),
        );
      default:
        return MaterialWithModalsPageRoute(
          builder: (context) => ErrorPage(),
        );
    }
  }
}
