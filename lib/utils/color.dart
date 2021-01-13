import 'package:flutter/cupertino.dart' as c;

/// Enum for mood colors
enum MoodColor {
  systemBlue,
  systemIndigo,
  systemGreen,
  systemYellow,
  systemOrange,
  systemRed,
  // not using yet,
  // systemPink,
  // systemPurple,
  // systemTeal,
}

/// Takes the enum [MoodColor] and returns the [CupertinoDynamicColor]
c.CupertinoDynamicColor getColor(MoodColor color) {
  switch (color) {
    case MoodColor.systemBlue:
      return c.CupertinoColors.activeBlue;
    case MoodColor.systemIndigo:
      return c.CupertinoColors.systemIndigo;
    case MoodColor.systemGreen:
      return c.CupertinoColors.systemGreen;
    case MoodColor.systemYellow:
      return c.CupertinoColors.systemYellow;
    case MoodColor.systemOrange:
      return c.CupertinoColors.systemOrange;
    case MoodColor.systemRed:
      return c.CupertinoColors.systemRed;
    default:
      return c.CupertinoColors.systemGrey5;
  }
}
