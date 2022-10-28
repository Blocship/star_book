import 'package:flutter/material.dart';

class SbTabBarThemeData {
  final BoxDecoration? tabBarDecoration;
  final BoxDecoration? selectedTabDecoration;
  final BoxDecoration? unselectedTabDecoration;
  final TextStyle? selectedTabLabelStyle;
  final TextStyle? unselectedTabLabelStyle;

  SbTabBarThemeData({
    this.selectedTabDecoration,
    this.unselectedTabDecoration,
    this.tabBarDecoration,
    this.selectedTabLabelStyle,
    this.unselectedTabLabelStyle,
  });
}
