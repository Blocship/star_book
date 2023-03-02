import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/screen/analytics_screens/analytics_tab_bar_view.dart';
import 'package:star_book/presentation/screen/calendar/month_days.dart';
import 'package:star_book/presentation/screen/intro_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_detail_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_edit_screen.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_create_screen.dart';
import 'package:star_book/presentation/screen/license_agreement_screen.dart';
import 'package:star_book/presentation/screen/main_screen.dart';
import 'package:star_book/presentation/screen/setting_screen.dart';
import 'package:star_book/presentation/screen/splash_screen.dart';
import 'package:star_book/presentation/screen/year_screen.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/month_details.dart';

class AppRouter {
  ///Routes Paths
  static const String splashScreenPath = '/';
  static const String introScreenPath = '/introScreen';
  static const String mainScreenPath = '/mainScreen';
  static const String yearScreenPath = 'yearScreen';
  static const String monthScreenPath =
      'monthScreen/:year/:month/:isHomeScreen';
  static const String journalCreateScreenPath = 'journalCreateScreen';
  static const String journalDetailScreenPath = 'journalDetailScreen';
  static const String journalEditScreenPath = 'journalEditScreen';
  static const String analyticScreenPath = 'analyticScreen';
  static const String settingScreenPath = 'settingScreen';
  static const String licenseAgreementScreenPath = 'licenseAgreementScreen';

  static final GoRouter appRoutes = GoRouter(
    routes: <RouteBase>[
      ///SplashScreen
      GoRoute(
        name: AppRouterName.splashScreen,
        path: splashScreenPath,
        builder: (context, state) => const SplashScreen(),
      ),

      ///IntroScreen
      GoRoute(
        name: AppRouterName.introScreen,
        path: introScreenPath,
        builder: (context, state) => IntroScreen(),
      ),

      ///MainScreen
      GoRoute(
        name: AppRouterName.mainScreen,
        path: mainScreenPath,
        builder: (context, state) => const MainScreen(),
        routes: <RouteBase>[
          ///YearScreen
          GoRoute(
            name: AppRouterName.yearScreen,
            path: yearScreenPath,
            builder: (context, state) => const YearScreen(),
            routes: <RouteBase>[
              ///MonthScreen
              GoRoute(
                name: AppRouterName.monthScreen,
                path: monthScreenPath,
                builder: (context, state) => MonthScreen(
                  monthDetails: MonthDetails(
                      year: int.parse(state.params['year'] ??
                          DateTime.now().year.toString()),
                      month: int.parse(state.params['month'] ??
                          DateTime.now().month.toString()),
                      isHomeScreen:
                          (state.params['isHomeScreen'] ?? 'true').parseBool()),
                ),
              ),
            ],
          ),

          ///JournalCreateScreen
          GoRoute(
            name: AppRouterName.journalCreateScreen,
            path: journalCreateScreenPath,
            builder: (context, state) => const JournalCreateScreen(),
          ),

          ///JournalDetailScreen
          GoRoute(
            name: AppRouterName.journalDetailScreen,
            path: journalDetailScreenPath,
            builder: (context, state) => const JournalDetailScreen(),
            routes: <RouteBase>[
              ///JournalEditScreen
              GoRoute(
                name: AppRouterName.journalEditScreen,
                path: journalEditScreenPath,
                builder: (context, state) => const JournalEditScreen(),
              ),
            ],
          ),

          ///AnalyticScreen
          GoRoute(
            name: AppRouterName.analyticScreen,
            path: analyticScreenPath,
            builder: (context, state) => const AnalyticsTabBarView(),
          ),

          ///SettingScreen
          GoRoute(
            name: AppRouterName.settingScreen,
            path: settingScreenPath,
            builder: (context, state) => const SettingScreen(),
            routes: <RouteBase>[
              ///LicenseAgreementScreen
              GoRoute(
                name: AppRouterName.licenseAgreementScreen,
                path: licenseAgreementScreenPath,
                pageBuilder: (context, state) => const MaterialPage(
                  child: LicenseAgreementScreen(),
                  fullscreenDialog: true,
                ),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
