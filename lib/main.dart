import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Files
import './api/unsplash_api_service.dart';
import './controllers/activity.dart';
import './models/activity.dart';
import './models/global_setting.dart';
import './models/mood.dart';
import './routes/route_generator.dart';
import 'services/notification_service/notification_service.dart';
import './controllers/global_setting.dart';

/// HeadlessTask executed moments after the app has been terminated
/// (Android only)
void backgroundFetchHeadlessTask(String taskId) async {
  await NotificationService().checkDiary();
  BackgroundFetch.finish(taskId);
}

/// Starting point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().notificationInitialization();
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  // This method is not applicable on iPad when multitasking is enabled.
  await SystemChrome.setPreferredOrientations([
    // Locks the device orientation in PortraitUp only.
    DeviceOrientation.portraitUp
  ]);
  await hiveInitialize();
  await ActivityController.initialize();
  await DotEnv().load('.env');
  runApp(MyApp());
}

Future<void> hiveInitialize() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Activity>(ActivityAdapter());
  Hive.registerAdapter<Mood>(MoodAdapter());
  Hive.registerAdapter<BrightnessOption>(BrightnessOptionAdapter());
  Hive.registerAdapter<User>(UserAdapter());
  await Hive.openBox<Activity>(activityBoxName);
  await Hive.openBox(globalSettingBoxName);
}

// function to return brightness for theme data
Brightness get brightness {
  var mode = GlobalSettingController.getBrightnessOption();
  Brightness themeMode;
  if (mode == BrightnessOption.light) {
    themeMode = Brightness.light;
  } else if (mode == BrightnessOption.dark) {
    themeMode = Brightness.dark;
  } else if (mode == BrightnessOption.auto) {
    themeMode = WidgetsBinding.instance.window.platformBrightness;
  }
  return themeMode;
}

/// MyApp is the most Parent widget and initialises the main route.
///
/// [HomePage] initial route
class MyApp extends c.StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends c.State<MyApp> {
  @override
  void initState() {
    super.initState();
    initFetchState();
  }

  /// Configures and schedules a task with [taskId] to be executed
  /// after every 15 minutes of interval (when the app is terminated
  /// from the background as well).
  Future<void> initFetchState() async {
    BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15,
          enableHeadless: true,
          stopOnTerminate: false,
        ), (String taskId) async {
      await NotificationService().checkDiary();
      BackgroundFetch.finish(taskId);
    });
    BackgroundFetch.scheduleTask(
      TaskConfig(
        taskId: 'com.example.headlesstask',
        delay: 30 * 60000,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.ValueListenableBuilder(
        valueListenable: Hive.box(globalSettingBoxName).listenable(),
        builder: (context, box, widget) {
          return c.CupertinoApp(
            initialRoute: '/username_add',
            title: "StarBook",
            theme: c.CupertinoThemeData(brightness: brightness),
            localizationsDelegates: [
              DefaultMaterialLocalizations.delegate,
              c.DefaultCupertinoLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
            ],
            onGenerateRoute: (settings) => RouteGenerator.mainRoute(settings),
          );
        });
  }
}
