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
  if (width < 400.0) {
    return ScreenSizes.small;
  } else {
    return ScreenSizes.medium;
  }
}

/// Gets the size of the day number widget.
double getDayNumberSize(BuildContext context) {
  return screenSize(context) == ScreenSizes.small ? 12.0 : 16.0;
}

/// Gets the vertical space that one month view takes up.
double getMonthViewHeight(BuildContext context) {
  const double padding = 8.0;
  const double titleHeight = 21.0;

  return (2 * padding) + titleHeight + 8.0 + (6 * getDayNumberSize(context));
}

/// Gets the vertical space that one year view takes up.
/// Some years will have extra vertical space equal to the size of a day number.
double getYearViewHeight(BuildContext context) {
  const double topPadding = 40.0;
  final double titleHeight =
      screenSize(context) == ScreenSizes.small ? 26.0 : 31.0;
  const double dividerHeight = 16.0;

  return topPadding +
      titleHeight +
      8.0 +
      dividerHeight +
      (4 * getMonthViewHeight(context) - getDayNumberSize(context));
}
