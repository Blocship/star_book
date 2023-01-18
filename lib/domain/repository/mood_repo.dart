import 'package:star_book/data/models/mood/mood.dart';

import 'base_repo.dart';

abstract class MoodRepo extends BaseRepo {
  Future<List<Mood>> getMoods({required String emotionId});
}
