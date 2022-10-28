import 'package:star_book/api/base_api.dart';
import 'package:star_book/models/mood/mood.dart';

abstract class MoodApi extends BaseApi {
  static const String collectionName = 'moodCollection';

  Stream<List<Mood>> getMoodStream();

  Future<void> delete(String moodId);
  Future post(Mood mood);
}