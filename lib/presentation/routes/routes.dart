import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/domain/models/mood/day.dart';
import 'package:star_book/presentation/screen/analytics_screens/analytics_tab_bar_view.dart';
import 'package:star_book/presentation/screen/home_screen.dart';
import 'package:star_book/presentation/screen/intro_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_create_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_detail_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_edit_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_list_screen.dart';
import 'package:star_book/presentation/screen/license/license_agreement_screen.dart';
import 'package:star_book/presentation/screen/main_screen.dart';
import 'package:star_book/presentation/screen/profile_screen.dart';
import 'package:star_book/presentation/screen/setting_screen.dart';
import 'package:star_book/presentation/screen/splash_screen.dart';
import 'package:star_book/presentation/screen/year_screen.dart';
import 'package:star_book/presentation/service/navigator.dart';

part 'extension.dart';

part 'route_argument.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter appRoutes = GoRouter(
    initialLocation: SplashScreenRoute.path,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      return null;
    },
    observers: [LoggerNavigatorObserver()],
    routes: <RouteBase>[
      ///SplashScreen
      GoRoute(
        path: SplashScreenRoute.path,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          const arg = SplashScreenRoute();
          return const SplashScreen(arg: arg);
        },
      ),

      ///IntroScreen
      GoRoute(
        path: IntroScreenRoute.path,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          const arg = IntroScreenRoute();
          return IntroScreen(arg: arg);
        },
      ),

      /// MainScreen
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          const arg = MainScreenRoute();
          return MainScreen(arg: arg, child: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              /// YearScreen
              GoRoute(
                path: YearScreenRoute.path,
                builder: (context, state) {
                  const arg = YearScreenRoute();
                  return const YearScreen(arg: arg);
                },
                routes: [
                  /// HomeScreen
                  GoRoute(
                    path: HomeScreenRoute.path,
                    builder: (context, state) {
                      final arg =
                          HomeScreenRoute.fromMap(state.queryParameters);
                      return HomeScreen(arg: arg);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              /// ProfileScreen
              GoRoute(
                path: ProfileScreenRoute.path,
                builder: (context, state) {
                  const arg = ProfileScreenRoute();
                  return const ProfileScreen(arg: arg);
                },
                routes: [
                  /// AnalyticsScreen
                  GoRoute(
                    path: AnalyticsScreenRoute.path,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      const arg = AnalyticsScreenRoute();
                      return const AnalyticsScreen(arg: arg);
                    },
                  ),

                  /// SettingsScreen
                  GoRoute(
                    path: SettingsScreenRoute.path,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      const arg = SettingsScreenRoute();
                      return const SettingsScreen(arg: arg);
                    },
                    routes: [
                      /// LicenseAgreementScreen
                      GoRoute(
                        path: LicenseAgreementScreenRoute.path,
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) {
                          const arg = LicenseAgreementScreenRoute();
                          return const LicenseAgreementScreen(arg: arg);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      /// Journals
      GoRoute(
        path: JournalsListScreenRoute.path,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final arg = JournalsListScreenRoute.fromMap(state.queryParameters);
          return JournalsListScreen(arg: arg);
        },
        routes: [
          /// JournalCreateScreen
          GoRoute(
            path: JournalCreateScreenRoute.path,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) {
              final arg =
                  JournalCreateScreenRoute.fromMap(state.queryParameters);
              return JournalCreateScreen(arg: arg);
            },
          ),

          /// JournalDetailScreen
          GoRoute(
            path: JournalDetailScreenRoute.path,
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state) {
              final arg =
                  JournalDetailScreenRoute(id: state.pathParameters['id']!);
              return JournalDetailScreen(arg: arg);
            },
            routes: [
              /// JournalEditScreen
              GoRoute(
                path: JournalEditScreenRoute.path,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  final arg =
                      JournalEditScreenRoute(id: state.pathParameters['id']!);
                  return JournalEditScreen(arg: arg);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @visibleForTesting
  static void printPaths() {
    final routes = appRoutes.routerDelegate.builder.configuration.routes;
    final routesLength = routes.length;
    for (int e = 0; e < routesLength; e++) {
      String decorator = _getDecorator(depth: 0, isLast: e == routesLength - 1);
      _printRoute(
        depth: 0,
        decorator: decorator,
        route: (routes[e]),
      );
    }
  }

  static void _printRoute({
    required int depth,
    String decorator = "",
    String previousPath = "",
    required RouteBase route,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    late final String path;
    if (route is GoRoute) {
      if (route.path.isNotEmpty && !route.path.startsWith('/')) {
        path = '$previousPath/${route.path}';
      } else {
        path = previousPath + route.path;
      }
      String screenName =
          route.builder?.runtimeType.toString().split("=> ").last ?? "";
      log("$decorator$path ($screenName)");
    } else if (route is StatefulShellRoute) {
      log("$decorator$previousPath(Shell Route)");
      path = previousPath;
    } else {
      log("$decorator$previousPath(Unknown Route)");
      path = previousPath;
    }

    if (route.routes.isEmpty) {
      return;
    }

    final int newDepth = depth + 1;
    final routesLength = route.routes.length;

    for (int e = 0; e < routesLength; e++) {
      String decorator = _getDecorator(
        depth: newDepth,
        isLast: e == routesLength - 1,
      );

      _printRoute(
        depth: newDepth,
        decorator: decorator,
        previousPath: path,
        route: route.routes[e] as GoRoute,
      );
    }
  }

  static String _getDecorator({
    required int depth,
    required bool isLast,
  }) {
    String decorator = "";
    for (int i = 0; i < depth; i++) {
      decorator += "  ";
    }
    if (isLast) {
      decorator += " └─";
    } else {
      decorator += " ├─";
    }
    return decorator;
  }
}
