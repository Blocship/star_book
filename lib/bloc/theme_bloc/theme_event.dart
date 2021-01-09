import 'package:equatable/equatable.dart';
import 'package:star_book/screens/preferance_sheet.dart';

abstract class ThemeEvent extends Equatable {}

class ThemeChangeEvent extends ThemeEvent {
  final BrightnessOption option;

  ThemeChangeEvent({this.option});
  @override
  List<Object> get props => [];
}
