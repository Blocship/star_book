import 'package:hive/hive.dart';

// Files
import '../models/global_setting.dart';

class GlobalSettingController {
  User getuser() {
    return User(name: 'John Deo');
  }

  void setUser(User user) {}

  BrightnessOption getBrightnessOption() {
    return BrightnessOption.auto;
  }

  void setbrightnessOption(BrightnessOption brightnessOption) {}

  DateTime getReminderTime() {
    return DateTime.now();
  }

  void setReminderTime(DateTime reminderTime) {}
}
