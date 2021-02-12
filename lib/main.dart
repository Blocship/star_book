import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Files
import './controllers/activity.dart';
import './controllers/global_setting.dart';
import './models/activity.dart';
import './models/global_setting.dart';
import './models/mood.dart';
import './routes/route_generator.dart';
import './utils/brightness.dart';
import './utils/string.dart';

/// Starting point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

/// MyApp is the most Parent widget and initialises the main route.
///
/// [HomePage] initial route
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(globalSettingBoxName).listenable(),
      builder: (context, box, widget) {
        return c.CupertinoApp(
          initialRoute: (isNullOrEmpty(GlobalSettingController.getuser().name))
              ? 'username_add'
              : 'home',
          title: "StarBook",
          theme: c.CupertinoThemeData(brightness: brightness),
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            c.DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          onGenerateRoute: (settings) => RouteGenerator.mainRoute(settings),
        );
      },
    );
  }
}
