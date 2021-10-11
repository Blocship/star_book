import 'package:flutter/cupertino.dart';
import 'package:star_book/models/brightness.dart';

// Files
import '../controllers/global_setting.dart';

/// function to return brightness for theme data
Brightness get brightness {
  final BrightnessOption mode = GlobalSettingController.getBrightnessOption();

  if (mode == BrightnessOption.light) {
    return Brightness.light;
  } else if (mode == BrightnessOption.dark) {
    return Brightness.dark;
  } else {
    // (mode == BrightnessOption.auto)
    return WidgetsBinding.instance!.window.platformBrightness;
  }
}
