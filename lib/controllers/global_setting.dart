import 'package:hive/hive.dart';

// Files
import '../models/global_setting.dart';

class GlobalSettingController {
  static User getuser() {
    return Hive.box(globalSettingBoxName).get(
      userBoxName,
      defaultValue: '',
    ) as User;
  }

  static void setUser(User user) async {
    await Hive.box(globalSettingBoxName).put(
      userBoxName,
      user,
    );
  }

  static BrightnessOption getBrightnessOption() {
    return Hive.box(globalSettingBoxName).get(
      brightnessBoxName,
      defaultValue: BrightnessOption.auto,
    );
  }

  static void setbrightnessOption(BrightnessOption brightnessOption) async {
    await Hive.box(globalSettingBoxName).put(
      brightnessBoxName,
      brightnessOption,
    );
  }

  static DateTime getReminderTime() {
    DateTime defaultTime = DateTime.parse('2021-01-16 19:00:00');
    return Hive.box(globalSettingBoxName).get(
      reminderBoxName,
      defaultValue: defaultTime,
    );
  }

  static void setReminderTime(DateTime reminderTime) async {
    await Hive.box(globalSettingBoxName).put(
      reminderTime,
      reminderTime,
    );
  }
}
