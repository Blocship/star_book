import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workmanager/workmanager.dart';

// Files
import './api/unsplash_api_service.dart';
import './models/activity.dart';
import './models/mood.dart';
import './routes/route_generator.dart';
import 'services/notification_service/notification_service.dart';

void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    await NotificationService().checkDiary();
    return Future.value(true);
  });
}

/// Starting point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager.registerPeriodicTask(
    "200",
    "CheckDiaryTask",
    frequency: Duration(hours: 1),
  );
  await NotificationService().notificationInitialization();
  await Hive.initFlutter();
  Hive.registerAdapter<Activity>(ActivityAdapter());
  Hive.registerAdapter<Mood>(MoodAdapter());
  await Hive.openBox<Activity>(activityBoxName);
  UnsplashAPIService.loadenv();
  runApp(MyApp());
}

/// MyApp is the most Parent widget and initialises the main route.
///
/// [HomePage] initial route
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoApp(
      initialRoute: '/',
      title: "StarBook",
      theme: c.CupertinoThemeData(),
      onGenerateRoute: (settings) => RouteGenerator.mainRoute(settings),
    );
  }
}
