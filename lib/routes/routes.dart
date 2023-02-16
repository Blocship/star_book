import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/screen/analytics_screens/analytics_tab_bar_view.dart';
import 'package:star_book/presentation/screen/intro_screen.dart';
import 'package:star_book/presentation/screen/main_screen.dart';
import 'package:star_book/presentation/screen/setting_screen.dart';
import 'package:star_book/presentation/screen/splash_screen.dart';
import 'package:star_book/presentation/screen/year_screen.dart';

class AppRouter {
  final GoRouter appRoutes = GoRouter(
    routes: <RouteBase>[
      /// Splash Screen Navigation InitialRoute
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
        routes: <RouteBase>[
          /// IntroScreen Navigation from SplashScreen
          GoRoute(
            path: 'introScreen',
            builder: (context, state) => const IntroScreen(),
            routes: <RouteBase>[
              /// MainScreen Navigation from IntroScreen
              GoRoute(
                path: 'mainScreen',
                builder: (context, state) => const MainScreen(),
                routes: <RouteBase>[
                  /// Journal Create Screen from HomeScree
                  // GoRoute(
                  //   path: 'journalCreateScreen',
                  //   builder: (context, state) => const JournalCreateScreen(),
                  //   routes: <RouteBase>[
                  //     /// Date Picker Screen from Journal Create Screen
                  //     GoRoute(
                  //       path: 'datePickerScreen',
                  //       builder: (context, state) => const DatePickerScreen(),
                  //       routes: <RouteBase>[
                  //         /// Mood Picker Screen from Journal Create Screen
                  //         GoRoute(
                  //           path: 'moodPickerScreen',
                  //           builder: (context, state) =>
                  //               const MoodPickerScreen(),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),

                  /// Journal Detail Screen from HomeScreen
                  // GoRoute(
                  //   path: 'journalDetailScreen',
                  //   builder: (context, state) => const JournalDetailScreen(),
                  //   routes: <RouteBase>[
                  //     ///Journal Edit Screen from JournalDetailScreen
                  //     GoRoute(
                  //       path: 'journalEditScreen',
                  //       builder: (context, state) => const JournalEditScreen(),
                  //     ),
                  //   ],
                  // ),

                  /// Year Screen Navigation from HomeScreen
                  GoRoute(
                    path: 'yearScreen',
                    builder: (context, state) => const YearScreen(),
                    routes: <RouteBase>[
                      /// Month Screen Navigation from YearScreen
                      GoRoute(
                        path: 'monthScreen',
                        builder: (context, state) => const YearScreen(),
                      ),
                    ],
                  ),

                  /// Setting Screen Navigation from ProfileScreen
                  GoRoute(
                    path: 'settingScreen',
                    builder: (context, state) => const SettingScreen(),
                  ),

                  /// Analytics Screen Navigation from ProfileScreen
                  GoRoute(
                    path: 'analyticsScreen',
                    builder: (context, state) => const AnalyticsTabBarView(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
