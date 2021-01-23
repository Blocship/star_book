import 'package:hive/hive.dart';

// Files
import '../models/global_setting.dart';

/// Global Settings Controller Controls various functionalities for
/// [User] and [Brightness-Level] and [Remainder-Time] .
class GlobalSettingController {
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
      reminderTime,
      reminderTime,
    );
  }
}
