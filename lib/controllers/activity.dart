import 'package:hive/hive.dart';
// Files
import '../models/activity.dart';
import './id.dart';

/// Class with static methods, to provide `CRUD` operations for [Activity] model
class ActivityController {
  /// Adds new [Activity] in the, `Hive box`
  ///
  /// If you think it as relational database,
  /// it creates a new row in the [activityBoxName] Table
  static Future<void> create(Activity activity) async {
    print(Hive.box<Activity>(activityBoxName).length);
    String id = Id(activity.day, activity.month, activity.year).toString();
    return await Hive.box<Activity>(activityBoxName).put(id, activity);
  }

  /// Return all the [Activity]s from the, `Hive box`
  ///
  /// If you think it as relational database,
  /// it return all the rows from the [activityBoxName] Table
  static Map<String, Activity> readAll() {
    return Hive.box<Activity>(activityBoxName).toMap();
  }

  /// Returns the [Activity] w.r.t to the date from the, `Hive box`
  ///
  /// If you think it as relational database,
  /// if there is an index "dd-mm-yyyy" it returns the [Activity] from
  /// the [activityBoxName] Table
  /// else it returns default [Activity]
  static Activity readAt(int day, int month, int year) {
    String id = Id(day, month, year).toString();
    return Hive.box<Activity>(activityBoxName).get(
      id,
      defaultValue: Activity(day: day, month: month, year: year),
    );
  }

  /// Updates the [Activity] w.r.t to the date from the, `Hive box`
  ///
  /// If you think it as relational database,
  /// It updates the [Activity]'s moodId, title and note,
  /// at given day, month and year in the [activityBoxName] Table
  static Future<void> update(Activity activity) async {
    return await create(activity);
  }

  /// Deletes the [Activity] w.r.t to the date from the, `Hive box`
  static Future<void> delete(Activity activity) async {
    String id = Id(activity.day, activity.month, activity.year).toString();
    await Hive.box<Activity>(activityBoxName).delete(id);
  }
}
