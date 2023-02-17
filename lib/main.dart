import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:star_book/config.dart';
import 'package:star_book/data/utils/local_database.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/screen/splash_screen.dart';
import 'package:star_book/theme/ultramarine_light.dart';

String createDirectory({required String path}) {
  if (!Directory(path).existsSync()) {
    Directory(path).createSync(recursive: true);
  }
  return path;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  assert(
    Config().isDevelopment,
    'Please run in dev enveriment for debugging. i.e. --dart-define=flavor=dev',
  );
  final directory = await getApplicationDocumentsDirectory();
  await LocalDatabase.initialise(
    directory: createDirectory(
      path: directory.path + Config().cacheDirectory,
    ),
  );
  await Injector.initialise();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: UltramarineLightTheme().theme,
      home: const SplashScreen(),
    );
  }
}
