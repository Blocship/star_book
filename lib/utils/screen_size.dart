import 'package:flutter/material.dart';

enum ScreenSize {
  small,
  medium,
  large,
}

ScreenSize screenWidth(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  if (width < 400.0) {
    return ScreenSize.small;
  } else {
    return ScreenSize.medium;
  }
}
