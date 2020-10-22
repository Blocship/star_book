import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Files
import '../models/activity.dart';
import './id.dart';

class ActivityController {
  static Future<void> create(Activity activity) async {
    print(Hive.box<Activity>(activityBoxName).length);
    String id = Id(activity.day, activity.month, activity.year).toString();
    return await Hive.box<Activity>(activityBoxName).put(id, activity);
  }

  static Map<String, Activity> readAll() {
    return Hive.box<Activity>(activityBoxName).toMap();
  }

  static Activity readAt(int day, int month, int year) {
    String id = Id(day, month, year).toString();
    return Hive.box<Activity>(activityBoxName).get(
      id,
      defaultValue: Activity(day: day, month: month, year: year),
    );
  }

  static Future<void> update(Activity activity) async {
    return await create(activity);
  }

  static Future<void> delete(Activity activity) async {
    String id = Id(activity.day, activity.month, activity.year).toString();
    await Hive.box<Activity>(activityBoxName).delete(id);
  }
}
