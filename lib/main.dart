import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:star_book/app_settings.dart';
import 'package:star_book/config.dart';
import 'package:star_book/data/utils/local_database.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/firebase.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  assert(
    kEnvironment.isStaging,
    'Please run in dev environment for debugging. i.e. --dart-define=flavor=qa',
  );
  // todo, use injector for services, to be accessible from anywhere
  final service = FirebaseService();
  await service.initialise();
  final reportingService = ReportingService();
  await reportingService.initialise();

  final config = Config();
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
