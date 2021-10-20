import 'package:hive/hive.dart';
import 'package:star_book/models/brightness.dart';
import 'package:star_book/models/user.dart';

// Files
import '../models/index.dart';

/// Global Settings Controller Controls various functionalities for
/// [User] and [Brightness-Level] and [Remainder-Time] .
class GlobalSettingController {
  static final GlobalSettingController globalSettingControllerSingleton = GlobalSettingController._internal();
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
    final DateTime defaultTime = DateTime.parse('2021-01-16 19:00:00');
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
}
