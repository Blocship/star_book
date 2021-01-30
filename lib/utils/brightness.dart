import 'package:flutter/cupertino.dart';

// Files
import '../controllers/global_setting.dart';
import '../models/global_setting.dart';

/// function to return brightness for theme data
Brightness get brightness {
  var mode = GlobalSettingController.getBrightnessOption();
  Brightness themeMode;
  if (mode == BrightnessOption.light) {
    themeMode = Brightness.light;
  }
  else if (mode == BrightnessOption.dark) {
    themeMode = Brightness.dark;
  }
  else if (mode == BrightnessOption.auto) {
    themeMode = WidgetsBinding.instance.window.platformBrightness;
  }
  return themeMode;
}