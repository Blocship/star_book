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

// class PickerData {
//   final Mood mood;
//   final DateTime dateTime;
//   const PickerData({required this.mood, required this.dateTime});
//   factory PickerData.initial() => PickerData(
//         mood: const Mood(id: '0', label: 'label', color: 0xFFFFFFFF),
//         dateTime: DateTime(
//             DateTime.now().year, DateTime.now().month, DateTime.now().day),
//       );
// }
