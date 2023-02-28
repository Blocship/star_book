import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/domain/models/mood/mood.dart';

class PickerCubit extends Cubit<PickerData> {
  PickerCubit() : super(PickerData.initial());

  void savePickerData({required PickerData pickerData}) {
    emit(pickerData);
  }
}

class PickerData {
  final Mood mood;
  final DateTime dateTime;
  const PickerData({required this.mood, required this.dateTime});
  factory PickerData.initial() => PickerData(
        mood: const Mood(id: '0', label: 'label', color: 0xFFFFFFFF),
        dateTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
      );
}
