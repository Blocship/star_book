import '../api/mood_api.dart';
import '../models/mood/mood.dart';
import '../packages/hive_collection.dart';
import 'base_repo.dart';

class MoodRepo extends BaseRepo {
  late final LSMoodApi lSMoodApi;
  late final HiveCollectionReference<Mood> _moodCollection;
  @override
  Future<void> initialize() async {
    _moodCollection =
        await HiveStore.instance.collection<Mood>(IMoodApi.collectionName);
    lSMoodApi = LSMoodApi(collection: _moodCollection);
  }

  Future<List<Mood>> getMoods({required String emotionId}) async {
    late final List<Mood> moods;
    moods = await lSMoodApi.getAll();
    return moods;
  }

  void populateMood(Mood mood) {
    _moodCollection.add(mood);
  }

  void populateMoods(Iterable<Mood> moods) {
    _moodCollection.addAll(moods);
  }
}
