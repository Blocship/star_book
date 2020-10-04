import 'package:flutter/cupertino.dart' as c;

enum Color {
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

c.CupertinoDynamicColor getColor(Color color) {
  switch (color) {
    case Color.systemBlue:
      return c.CupertinoColors.activeBlue;
    case Color.systemIndigo:
      return c.CupertinoColors.systemIndigo;
    case Color.systemGreen:
      return c.CupertinoColors.systemGreen;
    case Color.systemYellow:
      return c.CupertinoColors.systemYellow;
    case Color.systemOrange:
      return c.CupertinoColors.systemOrange;
    case Color.systemRed:
      return c.CupertinoColors.systemRed;
    default:
      return c.CupertinoColors.systemGrey5;
  }
}
