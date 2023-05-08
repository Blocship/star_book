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
import 'package:star_book/presentation/screen/main_screen.dart';
import 'package:star_book/presentation/screen/profile_screen.dart';
import 'package:star_book/presentation/screen/setting_screen.dart';
import 'package:star_book/presentation/screen/splash_screen.dart';
import 'package:star_book/presentation/screen/year_screen.dart';

part 'extension.dart';
part 'route_argument.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter appRoutes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: SplashScreenRoute.path,
    navigatorKey: _rootNavigatorKey,
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
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          const arg = MainScreenRoute();
          return MainScreen(arg: arg, child: child);
        },
        routes: <RouteBase>[
          /// YearScreen
          GoRoute(
            path: YearScreenRoute.path,
            parentNavigatorKey: _shellNavigatorKey,
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
                parentNavigatorKey: _shellNavigatorKey,
                // pageBuilder: (context, state) {
                //   const arg = HomeScreenRoute(month: 3, year: 2023);
                //   return const NoTransitionPage(child: HomeScreen(arg: arg));
                // },
                builder: (context, state) {
                  final arg = HomeScreenRoute.fromMap(state.queryParams);
                  return HomeScreen(arg: arg);
                },
              ),
            ],
          ),

          /// ProfileScreen
          GoRoute(
            path: ProfileScreenRoute.path,
            parentNavigatorKey: _shellNavigatorKey,
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
                builder: (context, state) {
                  const arg = AnalyticsScreenRoute();
                  return const AnalyticsScreen(arg: arg);
                },
              ),

              /// SettingsScreen
              GoRoute(
                path: SettingsScreenRoute.path,
                builder: (context, state) {
                  const arg = SettingsScreenRoute();
                  return const SettingsScreen(arg: arg);
                },
              ),
            ],
          ),
        ],
      ),

      /// Journals
      GoRoute(
        path: JournalsListScreenRoute.path,
        builder: (context, state) {
          final arg = JournalsListScreenRoute.fromMap(state.queryParams);
          return JournalsListScreen(arg: arg);
        },
        routes: [
          /// JournalCreateScreen
          GoRoute(
            path: JournalCreateScreenRoute.path,
            builder: (context, state) {
              final arg = JournalCreateScreenRoute.fromMap(state.queryParams);
              return JournalCreateScreen(arg: arg);
            },
          ),

          /// JournalDetailScreen
          GoRoute(
            path: JournalDetailScreenRoute.path,
            builder: (context, state) {
              final arg = JournalDetailScreenRoute(id: state.params['id']!);
              return JournalDetailScreen(arg: arg);
            },
            routes: [
              /// JournalEditScreen
              GoRoute(
                path: JournalEditScreenRoute.path,
                builder: (context, state) {
                  final arg = JournalEditScreenRoute(id: state.params['id']!);
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
