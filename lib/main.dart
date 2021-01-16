import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Files
import './api/unsplash_api_service.dart';
import './controllers/activity.dart';
import './models/activity.dart';
import './models/global_setting.dart';
import './models/mood.dart';
import './routes/route_generator.dart';

/// Starting point of the application.
void main() async {
  await hiveInitialize();
  await ActivityController.initialize();
  UnsplashAPIService.loadenv();
  runApp(MyApp());
}

Future<void> hiveInitialize() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Activity>(ActivityAdapter());
  Hive.registerAdapter<Mood>(MoodAdapter());
  await Hive.openBox<Activity>(activityBoxName);
  await Hive.openBox(globalSettingBoxName);
}

/// MyApp is the most Parent widget and initialises the main route.
///
/// [HomePage] initial route
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoApp(
      initialRoute: '/username_add',
      title: "StarBook",
      theme: c.CupertinoThemeData(),
      onGenerateRoute: (settings) => RouteGenerator.mainRoute(settings),
    );
  }
}
