import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/domain/models/mood/mood.dart';

class DatePickerCubit extends Cubit<DateTime> {
  DatePickerCubit() : super(DateTime.now());

  void saveDate({required DateTime dateTime}) {
    emit(dateTime);
  }
}

class MoodPickerCubit extends Cubit<Mood> {
  MoodPickerCubit() : super(Mood.initial());

  void saveMood({required Mood mood}) {
    emit(mood);
  }
}

class DateTimeQueryParamModel {
  final String? day;
  final String? month;
  final String? year;

  DateTimeQueryParamModel({this.day, this.month, this.year});
}

class MoodQueryParamModel {
  final String? id;
  final String? label;
  final String? color;

  MoodQueryParamModel({this.id, this.label, this.color});
}
