import 'package:flutter/widgets.dart';
import 'package:star_book/data/data_source/local_data_source/journal_api.dart';
import 'package:star_book/data/data_source/local_data_source/mood_api.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/models/mood/mood_frequency.dart';
import 'package:star_book/domain/models/mood/mood_info.dart';
import 'package:star_book/domain/repository/mood_repo.dart';

class MoodRepoImpl implements MoodRepo {
  final IMoodApi lSMoodApi;
  final IJournalApi lSJournalApi;

  MoodRepoImpl({
    required this.lSMoodApi,
    required this.lSJournalApi,
  });

  @override
  Future<void> initialize() async {}

  @override
  Future<List<Mood>> getMoods() async {
    final moods = await lSMoodApi.fetchAll();
    List<Mood> list = [];
    for (var mood in moods) {
      list.add(Mood.fromLSMood(mood));
    }
    return list;
  }

  @override
  Future<void> addMood({required MoodBody mood}) async {
    return lSMoodApi.create(mood.toLSMoodBody);
  }

  @override
  Future<void> deleteMood({required String id}) async {
    return lSMoodApi.delete(id);
  }

  @override
  Future<Mood> getMood({required String id}) async {
    final mood = await lSMoodApi.fetchById(id);
    return Mood.fromLSMood(mood);
  }

  @override
  Future<List<Mood>> getMoodInfoByDay({required DateTime day}) async {
    final journals = await lSJournalApi.fetchByDate(day);
    final moodInfo = MoodInfo.fromJournal(journals: journals);
    return moodInfo.getMoodsFor(day: day);
  }

  @override
  Future<MoodInfo> getMoodInfoByMonth({
    required int month,
    required int year,
  }) async {
    final journals = await lSJournalApi.getJournalByMonth(month, year);
    return MoodInfo.fromJournal(journals: journals);
  }

  @override
  Future<MoodInfo> getMoodInfoByRange(
      {required DateTime start, required DateTime end}) async {
    final journals = await lSJournalApi.getJournalByRange(start, end);
    return MoodInfo.fromJournal(journals: journals);
  }

  @override
  Future<MoodInfo> getMoodInfoByYear({required int year}) async {
    final journals = await lSJournalApi.getJournalByYear(year);
    return MoodInfo.fromJournal(journals: journals);
  }

  @override
  Future<void> updateMood({required String id, required MoodBody mood}) async {
    return lSMoodApi.update(id, mood.toLSMoodBody);
  }

  @override
  Future<MoodFrequency> getMoodFrequencyByMonth({
    required int month,
    required int year,
  }) async {
    final journals = await lSJournalApi.getJournalByMonth(month, year);
    final moodFrequency = MoodFrequency.fromJournal(journals: journals);
    return moodFrequency;
  }

  @override
  Future<MoodFrequency> getMoodFrequencyByRange({
    required DateTime start,
    required DateTime end,
  }) async {
    final journals = await lSJournalApi.getJournalByRange(start, end);
    final moodFrequency = MoodFrequency.fromJournal(journals: journals);
    return moodFrequency;
  }

  @override
  Future<void> addDefaultMoods() async {
    final moods = [
      MoodBody(label: 'Happy', color: const Color(0xff0179FF).value),
      MoodBody(label: 'Sad', color: const Color(0xff565AC9).value),
      MoodBody(label: 'Productive', color: const Color(0xff32C74F).value),
      MoodBody(label: 'Sick', color: const Color(0xffFF9600).value),
      MoodBody(label: 'Angry', color: const Color(0xffFF3932).value),
    ];
    for (var mood in moods) {
      await addMood(mood: mood);
    }
  }
}
