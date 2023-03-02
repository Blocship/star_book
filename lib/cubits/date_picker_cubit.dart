import 'package:flutter_bloc/flutter_bloc.dart';

class DatePickerCubit extends Cubit<DateTime> {
  DatePickerCubit() : super(DateTime.now());

  void saveDate({required DateTime dateTime}) {
    emit(dateTime);
  }
}
