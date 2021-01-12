import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_book/bloc/theme_bloc/theme.dart';
// Files
import './routes/route_generator.dart';
import './models/activity.dart';
import './models/mood.dart';

/// Starting point of the application.
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Activity>(ActivityAdapter());
  Hive.registerAdapter<Mood>(MoodAdapter());
  await Hive.openBox<Activity>(activityBoxName);
  runApp(MyApp());
}

/// MyApp is the most Parent widget and initialises the main route.
///
/// [HomePage] initial route
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => c.CupertinoApp(
          initialRoute: '/username_add',
          title: "StarBook",
          theme: state.theme,
          onGenerateRoute: (settings) => RouteGenerator.mainRoute(settings),
        ),
      ),
    );
  }
}
