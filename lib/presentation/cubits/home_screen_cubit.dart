import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/models/mood/mood_info.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/presentation/cubits/cubit_state/cubit_state.dart';

class HomeScreenCubit extends Cubit<CubitState<MoodInfo>> {
  final MoodRepo moodRepo;

  HomeScreenCubit({required this.moodRepo}) : super(const InitialState());

  Future<List<Mood>> getMoodInfoByDate({required DateTime day}) async {
    emit(const LoadingState());
    return await moodRepo.getMoodInfoByDay(day: day);
  }

  Future<void> getMoodInfoByMonth(
      {required int month, required int year}) async {
    emit(const LoadingState());
    await moodRepo.getMoodInfoByMonth(month: month, year: year);
  }

  Future<void> getMoodInfoByYear({required int year}) async {
    emit(const LoadingState());
    await moodRepo.getMoodInfoByYear(year: year);
  }

  Future<void> getMoodInfoByRange(
      {required DateTime start, required DateTime end}) async {
    emit(const LoadingState());
    await moodRepo.getMoodInfoByRange(start: start, end: end);
  }
}
