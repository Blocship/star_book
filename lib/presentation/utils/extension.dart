import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/presentation/theme/styling/filled_button_style.dart';
import 'package:star_book/presentation/theme/styling/floating_action_button_style.dart';
import 'package:star_book/presentation/theme/styling/gradient_scaffold_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';

/// Parsing Bool
extension BoolParsing on String {
  bool parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }
}

/// For Theme
extension XBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeColorStyle get themeColorStyle =>
      Theme.of(this).extension<ThemeColorStyle>()!;

  DoughnutChartStyle get doughnutChartStyle =>
      Theme.of(this).extension<DoughnutChartStyle>()!;

  FloatingActionButtonStyle get floatingActionButtonStyle =>
      Theme.of(this).extension<FloatingActionButtonStyle>()!;

  GradientScaffoldStyle get gradientScaffoldStyle =>
      Theme.of(this).extension<GradientScaffoldStyle>()!;

  CustomButtonTheme get customButtonTheme =>
      Theme.of(this).extension<CustomButtonTheme>()!;

  double get deviceHeight => MediaQuery.of(this).size.height;

  double get deviceWidth => MediaQuery.of(this).size.width;
}
