import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:star_book/screens/preferance_sheet.dart';

abstract class ThemeState extends Equatable {
  final CupertinoThemeData theme;
  final BrightnessOption option;

  ThemeState(this.theme, this.option);
}

class DefaultThemeState extends ThemeState {
  final CupertinoThemeData theme;
  final BrightnessOption option;

  DefaultThemeState(this.theme, this.option) : super(theme, option);
  @override
  List<Object> get props => [theme, option];
}

class ThemeChangeState extends ThemeState {
  final CupertinoThemeData theme;
  final BrightnessOption option;

  ThemeChangeState({this.theme, this.option}) : super(theme, option);
  @override
  List<Object> get props => [theme, option];
}
