import 'package:star_book/data/data_source/hive_data_source/mood_api.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/packages/hive_collection.dart';
import 'package:star_book/domain/repository/mood_repo.dart';

class MoodRepoImpl implements MoodRepo {
  late final LSMoodApi lSMoodApi;
  late final HiveCollectionReference<Mood> _moodCollection;

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<List<Mood>> getMoods({required String emotionId}) async {
    late final List<Mood> moods;
    moods = await lSMoodApi.fetchAll();
    return moods;
  }

  void populateMood(Mood mood) {
    _moodCollection.add(mood);
  }

  void populateMoods(Iterable<Mood> moods) {
    _moodCollection.addAll(moods);
  }
}
