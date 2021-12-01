import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:star_book/models/activity.dart';

// Files
import '../screens/acknowledgement_sheet/acknowledgement_sheet.dart';
import '../screens/activity_edit_sheet.dart';
import '../screens/activity_page.dart';
import '../screens/date_picker_sheet.dart';
import '../screens/error_page.dart';
import '../screens/home_page.dart';
import '../screens/mood_sheet.dart';
import '../screens/package_sheet.dart';
import '../screens/preference_sheet.dart/preference_sheet.dart';
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
      case Home.id:
        return MaterialWithModalsPageRoute(
          builder: (context) => Home(),
        );
      case ActivityPage.id:
        return MaterialWithModalsPageRoute(
          builder: (context) => ActivityPage(args as Activity),
        );
      case 'year':
        return MaterialWithModalsPageRoute(
          builder: (context) => YearPage(),
        );
      case 'preferance':
        return CupertinoModalBottomSheetRouteWrapper(
          builder: (context) => PreferenceRouteInitializer(),
        );
      case 'edit':
        return CupertinoModalBottomSheetRouteWrapper(
          builder: (context) => ActivityRouteInitializer(args as Activity),
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
    final args = settings.arguments;
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

  static Route<dynamic> preferenceRoute(
    RouteSettings settings,
  ) {
    final args = settings.arguments;
    switch (settings.name) {
      case 'preference/settings':
        return MaterialWithModalsPageRoute(
          builder: (context) => PreferenceSheet(),
        );
      case 'preference/acknowledgement':
        return MaterialWithModalsPageRoute(
          builder: (context) => AcknowledgementSheet(),
        );
      case 'preference/acknowledgement/licenses':
        return MaterialWithModalsPageRoute(
          builder: (context) => PackageSheet(args as PackageSheetArgument),
        );
      default:
        return MaterialWithModalsPageRoute(
          builder: (context) => ErrorPage(),
        );
    }
  }
}
