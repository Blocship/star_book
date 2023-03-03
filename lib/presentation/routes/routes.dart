import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/screen/home_screen.dart';
import 'package:star_book/presentation/screen/intro_screen.dart';
import 'package:star_book/presentation/screen/main_screen.dart';
import 'package:star_book/presentation/screen/profile_screen.dart';
import 'package:star_book/presentation/screen/splash_screen.dart';
import 'package:star_book/presentation/screen/year_screen.dart';

abstract class RouteArg {
  const RouteArg();
  String get parsedPath => uri.toString();
  Uri get uri;
}

abstract class Screen<T extends RouteArg> {
  T get arg;
}

class AppRouter {
  ///Routes Paths
  static const String yearScreenPath = 'yearScreen';
  static const String monthScreenPath =
      'mainScreen/monthScreen/:year/:month/:isHomeScreen';
  static const String journalCreateScreenPath = 'journalCreateScreen';
  static const String moodPickerScreenPath = 'moodPickerScreen';
  static const String datePickerScreenPath = 'datePickerScreen';
  static const String journalDetailScreenPath =
      'mainScreen/monthScreen/journalDetailScreen';
  static const String journalEditScreenPath =
      'mainScreen/monthScreen/journalEditScreen';
  static const String analyticScreenPath = 'analyticScreen';
  static const String settingScreenPath = 'settingScreen';
  static const String licenseAgreementScreenPath = 'licenseAgreementScreen';

  static final GoRouter appRoutes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: SplashScreenRoute.path,
    routes: <RouteBase>[
      ///SplashScreen
      GoRoute(
        path: SplashScreenRoute.path,
        builder: (context, state) {
          const arg = SplashScreenRoute();
          return const SplashScreen(arg: arg);
        },
      ),

      ///IntroScreen
      GoRoute(
        path: IntroScreenRoute.path,
        builder: (context, state) {
          const arg = IntroScreenRoute();
          return IntroScreen(arg: arg);
        },
      ),

      /// MainScreen
      ShellRoute(
        builder: (context, state, child) {
          const arg = MainScreenRoute();
          return MainScreen(arg: arg, child: child);
        },
        routes: <RouteBase>[
          /// main/year
          GoRoute(
            path: YearScreenRoute.path,
            // pageBuilder: (context, state) {
            //   const arg = YearScreenRoute();
            //   return const NoTransitionPage(child: YearScreen(arg: arg));
            // },
            builder: (context, state) {
              const arg = YearScreenRoute();
              return const YearScreen(arg: arg);
            },
            routes: [
              /// main/year/month
              GoRoute(
                path: HomeScreenRoute.path,
                // pageBuilder: (context, state) {
                //   const arg = HomeScreenRoute(month: 3, year: 2023);
                //   return const NoTransitionPage(child: HomeScreen(arg: arg));
                // },
                builder: (context, state) {
                  const arg = HomeScreenRoute(month: 3, year: 2023);
                  return const HomeScreen(arg: arg);
                },
              ),
            ],
          ),

          /// main/profile
          GoRoute(
            path: ProfileScreenRoute.path,
            // pageBuilder: (context, state) {
            //   const arg = ProfileScreenRoute();
            //   return const NoTransitionPage(child: ProfileScreen(arg: arg));
            // },
            builder: (context, state) {
              const arg = ProfileScreenRoute();
              return const ProfileScreen(arg: arg);
            },
          ),
        ],
      ),
    ],
  );
}

extension XBuildContext on BuildContext {
  void goToScreen({required RouteArg arg}) {
    go(arg.parsedPath);
  }

  void pushScreen({required RouteArg arg}) {
    push(arg.parsedPath);
  }

  String get location => GoRouter.of(this).location;
}
