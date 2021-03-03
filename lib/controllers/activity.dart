import 'package:hive/hive.dart';

// Files
import './id.dart';
import '../models/activity.dart';
import '../utils/date.dart';

/// Class with static methods, to provide `CRUD` operations for [Activity] model
class ActivityController {
  static final ActivityController _activityControllerSingleton =
      ActivityController._internal();
  ActivityController._internal();
  factory ActivityController() => _activityControllerSingleton;

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
    return Hive.box<Activity>(activityBoxName)
        .toMap()
        .map((id, activity) => MapEntry(id as String, activity));
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

  static Map<String, Activity> readRange(DateTime start, DateTime end) {
    return Map<String, Activity>.fromEntries(
      readAll().entries.where(
            (element) =>
                Id.from(element.key).toDateTime().isAtSameMomentAs(start) ||
                Id.from(element.key).toDateTime().isAtSameMomentAs(end) ||
                (Id.from(element.key).toDateTime().isAfter(start) &&
                    Id.from(element.key).toDateTime().isBefore(end)),
          ),
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

  /// Adds mock data for [Activity]s in the, `Hive box` (For testing purpose only)
  ///
  /// If you think it as relational database,
  /// It populates the [activityBoxName] Table by creating new rows
  /// for each [Activity] of mock data if [activityBoxName] Table is empty
  static Future<void> initialize() async {
    Map<String, Activity> existingActivities = readAll();
    if (existingActivities.isEmpty) {
      mActivityList.forEach((Activity activity) async {
        await create(activity);
      });
    }
  }

  /// moodID , occurance
  static Map<int, double> getMonthGraph(int year, int month) {
    int totalDays = getDaysInMonth(year, month);
    Map<String, Activity> activityMap = readRange(
      DateTime(year, month, 1),
      DateTime(year, month, totalDays),
    );
    Map<int, double> moodFrequency = Map<int, double>();
    activityMap.forEach((key, value) {
      moodFrequency[value.moodId] = moodFrequency.containsKey(value.moodId)
          ? moodFrequency[value.moodId] + 1
          : 1;
    });
    return moodFrequency;
  }

  /// moodID , occurance
  static Map<int, double> getLastMonthGraph() {
    DateTime currentDate = DateTime.now();
    int lastYear = getPreviousYear(currentDate.month, currentDate.year);
    int lastMonth = getPreviousMonth(currentDate.month, currentDate.year);

    return getMonthGraph(lastYear, lastMonth);
  }

  /// moodID , occurance
  static Map<int, double> get30DayGraph() {
    DateTime currentDate = DateTime.now();
    DateTime back30day = DateTime(
      getPreviousYear(currentDate.month, currentDate.year),
      getPreviousMonth(currentDate.month, currentDate.year),
      currentDate.day,
    );
    Map<String, Activity> activityMap = readRange(back30day, currentDate);
    Map<int, double> moodFrequency = Map<int, double>();
    activityMap.forEach((key, value) {
      moodFrequency[value.moodId] = moodFrequency.containsKey(value.moodId)
          ? moodFrequency[value.moodId] + 1
          : 1;
    });
    return moodFrequency;
  }

  static void getWeekGraph() {}

  /// Points is the total number of entries([Activity]s) in diary.
  static int points() {
    return readAll().length;
  }

  /// Latest consecutive activty count
  static int streak() {
    // TODO: Improve the time complexity. we can use database for that.
    DateTime date = DateTime.now();
    int streakCount = 0;
    Activity activity = readAt(date.day, date.month, date.year);
    if (activity.moodId == null) return streakCount;
    while (activity.moodId != null) {
      streakCount++;
      date = date.subtract(Duration(days: 1));
      activity = readAt(date.day, date.month, date.year);
    }
    return streakCount;
  }
}
