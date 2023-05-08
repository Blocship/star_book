part of 'routes.dart';

abstract class Screen<T extends RouteArg> {
  T get arg;
}

abstract class RouteArg {
  const RouteArg();
  String get parsedPath => uri.toString();
  Uri get uri;
}

class SplashScreenRoute extends RouteArg {
  static const String path = '/';

  const SplashScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class IntroScreenRoute extends RouteArg {
  static const String path = '/intro';

  const IntroScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class MainScreenRoute extends RouteArg {
  static const String path = '/main';

  const MainScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class YearScreenRoute extends RouteArg {
  static const String path = '/main/year';

  const YearScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class HomeScreenRoute extends RouteArg {
  // ?month=1&year=2023
  static const String path = 'month';
  final int? month;
  final int? year;
  const HomeScreenRoute({
    this.month,
    this.year,
  }) : super();

  factory HomeScreenRoute.fromMap(Map<String, String> map) {
    return HomeScreenRoute(
      month: int.tryParse(map['month'] ?? ''),
      year: int.tryParse(map['year'] ?? ''),
    );
  }

  @override
  Uri get uri => Uri(
        path: '/main/year/$path',
        queryParameters: {
          'month': month.toString(),
          'year': year.toString(),
        },
      );
}

class ProfileScreenRoute extends RouteArg {
  static const String path = '/main/profile';

  const ProfileScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class AnalyticsScreenRoute extends RouteArg {
  static const String path = 'analytics';

  const AnalyticsScreenRoute() : super();

  @override
  Uri get uri => Uri(path: '/main/profile/$path');
}

class SettingsScreenRoute extends RouteArg {
  static const String path = 'settings';

  const SettingsScreenRoute() : super();

  @override
  Uri get uri => Uri(path: '/main/profile/$path');
}

class LicenseAgreementScreenRoute extends RouteArg {
  static const String path = 'license';

  const LicenseAgreementScreenRoute() : super();

  @override
  Uri get uri => Uri(path: '/main/profile/settings/$path');
}

class JournalsListScreenRoute extends RouteArg {
  // ?date=2023-01-01
  static const String path = '/journal';

  final Day? day;

  const JournalsListScreenRoute({
    this.day,
  }) : super();

  factory JournalsListScreenRoute.fromMap(Map<String, String> map) {
    return JournalsListScreenRoute(
      day: map['date'] != null ? Day.fromDayKey(map['date']!) : null,
    );
  }

  @override
  Uri get uri => Uri(
        path: path,
        queryParameters: {
          'date': day?.dayKey,
        },
      );
}

class JournalCreateScreenRoute extends RouteArg {
  // ?date=2023-01-01
  static const String path = 'new';

  final Day day;

  const JournalCreateScreenRoute({
    required this.day,
  }) : super();

  factory JournalCreateScreenRoute.fromMap(Map<String, String> map) {
    return JournalCreateScreenRoute(
      day: map['date'] != null ? Day.fromDayKey(map['date']!) : Day.today(),
    );
  }

  @override
  Uri get uri => Uri(
        path: '/journal/$path',
        queryParameters: {
          'date': day.dayKey,
        },
      );
}

class JournalDetailScreenRoute extends RouteArg {
  static const String path = ':id';

  final String id;
  const JournalDetailScreenRoute({required this.id}) : super();

  @override
  //todo verify
  Uri get uri => Uri(path: '/journal/$id');
}

class JournalEditScreenRoute extends RouteArg {
  static const String path = 'edit';

  final String id;
  const JournalEditScreenRoute({required this.id}) : super();

  @override
  //todo verify
  Uri get uri => Uri(path: '/journal/$id/$path');
}
