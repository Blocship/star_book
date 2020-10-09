import 'package:flutter/cupertino.dart' as c;

enum EColor {
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

c.CupertinoDynamicColor getColor(EColor color) {
  switch (color) {
    case EColor.systemBlue:
      return c.CupertinoColors.activeBlue;
    case EColor.systemIndigo:
      return c.CupertinoColors.systemIndigo;
    case EColor.systemGreen:
      return c.CupertinoColors.systemGreen;
    case EColor.systemYellow:
      return c.CupertinoColors.systemYellow;
    case EColor.systemOrange:
      return c.CupertinoColors.systemOrange;
    case EColor.systemRed:
      return c.CupertinoColors.systemRed;
    default:
      return c.CupertinoColors.systemGrey5;
  }
}
