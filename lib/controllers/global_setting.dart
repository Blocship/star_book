import 'package:hive/hive.dart';
// Files
import '../utils/date.dart';
import '../models/streak.dart';
import '../models/global_setting.dart';

/// Global Settings Controller Controls various functionalities for
/// [User] and [Brightness-Level] and [Remainder-Time] .
class GlobalSettingController {
  static final GlobalSettingController globalSettingControllerSingleton =
      GlobalSettingController._internal();
  GlobalSettingController._internal();
  factory GlobalSettingController() => globalSettingControllerSingleton;

  /// Static method to getUser Details
  static User getuser() {
    return Hive.box(globalSettingBoxName).get(
      userBoxName,
      defaultValue: User(name: ''),
    ) as User;
  }

  /// Static method to set User
  static void setUser(User user) async {
    await Hive.box(globalSettingBoxName).put(
      userBoxName,
      user,
    );
  }

  /// Static method to Retrieve Brightness Option
  static BrightnessOption getBrightnessOption() {
    return Hive.box(globalSettingBoxName).get(
      brightnessBoxName,
      defaultValue: BrightnessOption.auto,
    );
  }

  /// Static method to Set Brightness Option
  static void setbrightnessOption(BrightnessOption brightnessOption) async {
    await Hive.box(globalSettingBoxName).put(
      brightnessBoxName,
      brightnessOption,
    );
  }

  /// Static method to Retrieve Reminder Time
  static DateTime getReminderTime() {
    DateTime defaultTime = DateTime.parse('2021-01-16 19:00:00');
    return Hive.box(globalSettingBoxName).get(
      reminderBoxName,
      defaultValue: defaultTime,
    ) as DateTime;
  }

  /// Static method to Set Brightness Time
  static void setReminderTime(DateTime reminderTime) async {
    await Hive.box(globalSettingBoxName).put(
      reminderBoxName,
      reminderTime,
    );
  }

  /// Static method to initialize Streak settings
  static void initStreakSettings() {
    DateTime _installedDate = getInstalledDate();
    if (_installedDate == null) {
      setInstalledDate(DateTime.now());
    }
  }

  ///Static method to get the Installed Date
  static DateTime getInstalledDate() {
    return Hive.box(globalSettingBoxName).get(
      installedDate,
    ) as DateTime;
  }

  ///Static method to Set the Installed Date
  static void setInstalledDate(DateTime _installedDate) async {
    _installedDate = getDate(_installedDate);
    await Hive.box(globalSettingBoxName).put(
      installedDate,
      _installedDate,
    );
  }

  ///Static method to get all Streaks of [Activity]s
  static List<StreakDataType> getAllStreaks() {
    return Hive.box(globalSettingBoxName).get(
      allStreaks,
      defaultValue: [],
    ) as List<StreakDataType>;
  }

  /// Static method to get the Longest Streak
  static StreakDataType getLongestStreak() {
    DateTime today = getDate(new DateTime.now());
    List<StreakDataType> streaks = getAllStreaks();
    StreakDataType currStreak = getCurrentStreak();
    Streak _appStreak = new Streak(streaks, currStreak);
    StreakDataType longestStreak = _appStreak.longestStreaks.isNotEmpty
        ? _appStreak.longestStreaks.first
        : StreakDataType(0, today, today);
    return longestStreak;
  }

  /// Static method to get the Longest Streak Count
  static int getLongestStreakCount() {
    DateTime today = getDate(new DateTime.now());
    List<StreakDataType> streaks = getAllStreaks();
    StreakDataType currStreak = getCurrentStreak();
    Streak _appStreak = new Streak(streaks, currStreak);
    StreakDataType longestStreak = _appStreak.longestStreaks.isNotEmpty
        ? _appStreak.longestStreaks.first
        : StreakDataType(0, today, today);
    return longestStreak.streakCount;
  }

  ///Static method to set the Last [Activity] Date
  static void setAllStreaks(List<StreakDataType> _allStreaks) async {
    await Hive.box(globalSettingBoxName).put(
      allStreaks,
      _allStreaks,
    );
  }

  ///Static method to get the Current Streak
  static StreakDataType getCurrentStreak() {
    DateTime today = getDate(new DateTime.now());
    return Hive.box(globalSettingBoxName).get(
      currentStreak,
      defaultValue: StreakDataType(0, today, today),
    );
  }

  ///Static method to get the Current Streak Count
  static int getCurrentStreakCount() {
    DateTime today = getDate(new DateTime.now());
    // Read the GlobalSetting Properties
    StreakDataType currStk = GlobalSettingController.getCurrentStreak();
    DateTime _lastActivityDate = currStk.streakEndDate;
    int daysTillLastActivity = today.difference(_lastActivityDate).inDays;
    // Check whether the last [Activity] was yesterday
    if (daysTillLastActivity == 1) {
      return currStk.streakCount;
    } else {
      return 0;
    }
  }

  ///Static method to set the Current Streak
  static void setCurrentStreak(StreakDataType _currentStreak) async {
    await Hive.box(globalSettingBoxName).put(
      currentStreak,
      _currentStreak,
    );
  }
}
