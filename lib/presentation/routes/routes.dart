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

part 'extension.dart';
part 'route_argument.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter appRoutes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: SplashScreenRoute.path,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      return null;
    },
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
                // parentNavigatorKey: _shellNavigatorKey,
                // pageBuilder: (context, state) {
                //   const arg = YearScreenRoute();
                //   return const NoTransitionPage(child: YearScreen(arg: arg));
                // },
                builder: (context, state) {
                  const arg = YearScreenRoute();
                  return const YearScreen(arg: arg);
                },
                routes: [
                  /// HomeScreen
                  GoRoute(
                    path: HomeScreenRoute.path,
                    // parentNavigatorKey: _shellNavigatorKey,
                    // pageBuilder: (context, state) {
                    //   const arg = HomeScreenRoute(month: 3, year: 2023);
                    //   return const NoTransitionPage(child: HomeScreen(arg: arg));
                    // },
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
                // parentNavigatorKey: _shellNavigatorKey,
                // pageBuilder: (context, state) {
                //   const arg = ProfileScreenRoute();
                //   return const NoTransitionPage(child: ProfileScreen(arg: arg));
                // },
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
}
