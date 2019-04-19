import 'package:flutter/material.dart';

/// Divides screen sizes into three categories.
enum ScreenSizes {
  small,
  medium,
  large,
}

/// Gets the screen size category of the screen.
ScreenSizes screenSize(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  if (width < 340) {
    return ScreenSizes.small;
  } else if (width < 540) {
    return ScreenSizes.medium;
  } else {
    return ScreenSizes.large;
  }
}

/// Gets the vertical space that one year view takes up.
double getYearViewHeight(context) {
  // TODO: a reliable solution needs to be found
  return 23 * getDayNumberSize(context);
}

/// Gets the size of the day number widget.
double getDayNumberSize(context) {
  return screenSize(context) == ScreenSizes.small ? 12.0 : 16.0;
}
