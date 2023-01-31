import 'package:star_book/domain/models/mood/mood.dart';

import 'base_repo.dart';

abstract class MoodRepo extends BaseRepo {
  Future<List<Mood>> getMoods({required String emotionId});
}
