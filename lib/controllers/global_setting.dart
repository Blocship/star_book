import 'package:hive/hive.dart';

// Files
import '../utils/date.dart';
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

  ///Static method to get the Last [Activity] Date
  static DateTime getLastActivityDate() {
    return Hive.box(globalSettingBoxName).get(
      lastActivityDate,
    ) as DateTime;
  }

  ///Static method to set the Last [Activity] Date
  static void setLastActivityDate(DateTime _lastActivityDate) async {
    _lastActivityDate = getDate(_lastActivityDate);
    await Hive.box(globalSettingBoxName).put(
      lastActivityDate,
      _lastActivityDate,
    );
  }

  ///Static method to get the Current Streak
  static int getCurrentStreak() {
    return Hive.box(globalSettingBoxName).get(
      currentStreak,
      defaultValue: 0,
    );
  }

  ///Static method to set the Current Streak
  static void setCurrentStreak(int _currentStreak) async {
    await Hive.box(globalSettingBoxName).put(
      currentStreak,
      _currentStreak,
    );
  }

  ///Static method to get the Longest Streak
  static int getLongestStreak() {
    return Hive.box(globalSettingBoxName).get(
      longestStreak,
      defaultValue: 0,
    );
  }

  ///Static method to Set the Longest Streak
  static void setLongestStreak(int _longestStreak) async {
    return Hive.box(globalSettingBoxName).put(
      longestStreak,
      _longestStreak,
    );
  }
}
