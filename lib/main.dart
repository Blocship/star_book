import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:star_book/app_settings.dart';
import 'package:star_book/config.dart';
import 'package:star_book/data/utils/local_database.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/theme/ultramarine_light.dart';

String createDirectory({required String path}) {
  if (!Directory(path).existsSync()) {
    Directory(path).createSync(recursive: true);
  }
  return path;
}

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    final config = Config();
    assert(
      config.isDevelopment,
      'Please run in dev environment for debugging. i.e. --dart-define=flavor=dev',
    );
    final directory = await getApplicationDocumentsDirectory();
    await LocalDatabase.initialise(
      directory: createDirectory(
        path: directory.path + config.cacheDirectory,
      ),
    );
    await Injector.initialise();
    final isFreshInstall = Injector.resolve<AppSettings>().isFreshInstall;
    if (isFreshInstall) {
      Injector.resolve<MoodRepo>().addDefaultMoods();
    }

    /// Run this statement when you reinstall your app
    /// for adding moods in backend (run only once)
    // Injector.resolve<MoodRepo>().addDefaultMoods();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    runApp(const MyApp());
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: UltramarineLightTheme().theme,
      routerConfig: AppRouter.appRoutes,
    );
  }
}
