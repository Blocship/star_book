import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/models/mood/mood_frequency.dart';
import 'package:star_book/domain/models/mood/mood_info.dart';

import 'base_repo.dart';

abstract class MoodRepo extends BaseRepo {
  Future<List<Mood>> getMoods();
  Future<Mood> getMood({required String id});
  Future<void> addMood({required MoodBody mood});
  Future<void> addDefaultMoods();
  Future<void> updateMood({required String id, required MoodBody mood});
  Future<void> deleteMood({required String id});
  Future<List<Mood>> getMoodInfoByDay({required DateTime day});
  Future<MoodInfo> getMoodInfoByMonth({required int month, required int year});
  Future<MoodInfo> getMoodInfoByYear({required int year});
  Future<MoodInfo> getMoodInfoByRange(
      {required DateTime start, required DateTime end});
  Future<MoodFrequency> getMoodFrequencyByMonth(
      {required int month, required int year});
  Future<MoodFrequency> getMoodFrequencyByRange(
      {required DateTime start, required DateTime end});
}
