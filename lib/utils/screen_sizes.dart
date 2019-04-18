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

/// Gets the vertical space that one year takes up.
double getYearViewHeight(context) {
  final int verticalDays = 6;
  final int verticalMonths = 4;
  return verticalDays * verticalMonths * getDayNumberSize(context) + 330.0;
}

/// Gets the space that the container of one day number takes up.
double getDayNumberSize(context) {
  return (MediaQuery.of(context).size.width - 72) / 21;
}
