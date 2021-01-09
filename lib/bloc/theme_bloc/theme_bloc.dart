import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/bloc/theme_bloc/theme_event.dart';
import 'package:star_book/bloc/theme_bloc/theme_state.dart';
import 'package:star_book/screens/preferance_sheet.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(DefaultThemeState(CupertinoThemeData(), BrightnessOption.auto));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChangeEvent) {
      if (event.option == BrightnessOption.dark) {
        yield ThemeChangeState(
          option: event.option,
          theme: CupertinoThemeData(brightness: Brightness.dark),
        );
      } else if (event.option == BrightnessOption.light) {
        yield ThemeChangeState(
          option: event.option,
          theme: CupertinoThemeData(brightness: Brightness.light),
        );
      } else if (event.option == BrightnessOption.auto) {
        yield ThemeChangeState(
          option: event.option,
          theme: CupertinoThemeData(),
        );
      }
    }
  }
}
