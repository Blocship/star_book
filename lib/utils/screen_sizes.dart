import 'package:flutter/material.dart';

/// Divide screensizes into 3 categories
enum ScreenSizes { small, medium, large }

/// Get the size of the screen
ScreenSizes screenSize(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  if (width < 340) return ScreenSizes.small;
  if (width < 540) return ScreenSizes.medium;
  return ScreenSizes.large;
}

// Vertical space that 1 year uses
double getYearViewHeight(context) {
  final int verticalDays = 6;
  final int verticalMonths = 4;
  return verticalDays * verticalMonths * getDayNumberSize(context) + 330.0;
}

// Get the space that the container of 1 daynumber uses
double getDayNumberSize(context) {
  return (MediaQuery.of(context).size.width - 72) / 21;
}