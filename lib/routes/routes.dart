import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/screen/analytics_screens/analytics_tab_bar_view.dart';
import 'package:star_book/presentation/screen/calendar/month_days.dart';
import 'package:star_book/presentation/screen/date_picker_screen.dart';
import 'package:star_book/presentation/screen/intro_screen.dart';
import 'package:star_book/presentation/screen/journal_detail_screen.dart';
import 'package:star_book/presentation/screen/journal_edit_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_create_screen.dart';
import 'package:star_book/presentation/screen/license_agreement_screen.dart';
import 'package:star_book/presentation/screen/main_screen.dart';
import 'package:star_book/presentation/screen/mood_picker_screen.dart';
import 'package:star_book/presentation/screen/setting_screen.dart';
import 'package:star_book/presentation/screen/splash_screen.dart';
import 'package:star_book/presentation/screen/year_screen.dart';
import 'package:star_book/presentation/shared/dialog_box.dart';
import 'package:star_book/presentation/utils/extension.dart';

// private navigators
// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

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
            name: 'IntroScreen',
            path: 'introScreen',
            builder: (context, state) => const IntroScreen(),
            routes: <RouteBase>[
              /// MainScreen Navigation from IntroScreen
              GoRoute(
                name: 'MainScreen',
                path: 'mainScreen',
                builder: (context, state) => const MainScreen(),
                routes: <RouteBase>[
                  ///TODO: Implement Shell Routes for

                  /// Journal Create Screen from HomeScree
                  GoRoute(
                    name: 'JournalCreateScreen',
                    path: 'journalCreateScreen',
                    builder: (context, state) => const JournalCreateScreen(),
                    routes: <RouteBase>[
                      /// Date Picker Screen from Journal Create Screen
                      GoRoute(
                        name: 'DatePickerScreen',
                        path: 'datePickerScreen',
                        builder: (context, state) => const DatePickerScreen(),
                      ),

                      /// Mood Picker Screen from Journal Create Screen
                      GoRoute(
                        name: 'MoodPickerScreen',
                        path: 'moodPickerScreen',
                        builder: (context, state) => const MoodPickerScreen(),
                      ),
                    ],
                  ),

                  /// Journal Detail Screen from HomeScreen
                  /// Journal Detail Screen and Journal Edit Screen takes parameter
                  GoRoute(
                    name: 'JournalDetailScreen',
                    path:
                        'journalDetailScreen/:detailDate/:detailMoodColor/:detailMood/:detailTitleDescription/:detailNoteDescription',
                    builder: (context, state) => JournalDetailScreen(
                      date: state.params['detailDate']!,
                      moodColor: Color(int.parse(
                          state.params['detailColor']!.substring(1),
                          radix: 16)),
                      // state.params['detailMoodColor']!,
                      mood: state.params['detailMood']!,
                      titleDescription: state.params['detailTitleDescription']!,
                      noteDescription: state.params['detailNoteDescription']!,
                    ),
                    routes: <RouteBase>[
                      ///Journal Edit Screen from JournalDetailScreen
                      GoRoute(
                        name: 'JournalEditScreen',
                        path:
                            'journalEditScreen/:date/:moodColor/:mood/:titleDescription/:noteDescription',
                        builder: (context, state) => JournalEditScreen(
                          date: state.params['date']!,
                          moodColor: Color(int.parse(
                              state.params['color']!.substring(1),
                              radix: 16)),
                          // moodColor: state.params['moodColor']!,
                          mood: state.params['mood']!,
                          titleDescription: state.params['titleDescription']!,
                          noteDescription: state.params['noteDescription']!,
                        ),
                      ),
                    ],
                  ),

                  /// DialogBox from Journal Detail Screen
                  GoRoute(
                    name: 'DialogBox',
                    path: 'dialogBox',
                    builder: (context, state) => const CustomDialogBox(),
                  ),

                  /// Year Screen Navigation from HomeScreen
                  GoRoute(
                    name: 'YearScreen',
                    path: 'yearScreen',
                    builder: (context, state) => const YearScreen(),
                    routes: <RouteBase>[
                      /// Month Screen Navigation from YearScreen
                      GoRoute(
                        name: 'MonthScreen',
                        path: 'daysOfMonth/:year/:month/:isHomeScreen',
                        builder: (context, state) => DaysOfMonth(
                          year: int.parse(state.params['year']!),
                          month: int.parse(state.params['month']!),
                          isHomeScreen:
                              state.params['isHomeScreen']!.parseBool(),
                        ),
                      ),
                    ],
                  ),

                  /// Setting Screen Navigation from ProfileScreen
                  GoRoute(
                    name: 'SettingScreen',
                    path: 'settingScreen',
                    builder: (context, state) => const SettingScreen(),
                  ),

                  /// LicenseScreenAgreement Bottom Sheet pop-up from Setting Screen
                  GoRoute(
                    name: 'LicenseAgreementScreen',
                    path: 'licenseAgreementScreen',
                    pageBuilder: (context, state) => const MaterialPage(
                      child: LicenseAgreementScreen(),
                      fullscreenDialog: true,
                    ),
                  ),

                  /// Analytics Screen Navigation from ProfileScreen
                  GoRoute(
                    name: 'AnalyticsScreen',
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
