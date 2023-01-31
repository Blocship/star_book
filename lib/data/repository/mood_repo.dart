import 'package:star_book/data/data_source/local_data_source/mood_api.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/repository/mood_repo.dart';

class MoodRepoImpl implements MoodRepo {
  final IMoodApi lSMoodApi;

  MoodRepoImpl({required this.lSMoodApi});

  @override
  Future<void> initialize() async {}

  @override
  Future<List<Mood>> getMoods({required String emotionId}) async {
    final moods = await lSMoodApi.fetchAll();
    List<Mood> list = [];
    for (var mood in moods) {
      list.add(Mood.fromLSMood(mood));
    }
    return list;
  }
}
