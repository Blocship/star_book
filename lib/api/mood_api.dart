import 'package:star_book/api/base_api.dart';
import 'package:star_book/models/journal/journal.dart';
import 'package:star_book/models/mood/mood.dart';
import 'package:star_book/packages/hive_collection.dart';

abstract class MoodApi extends BaseApi {
  static const String collectionName = 'journalCollection';

  Stream<List<Mood>> getJournalStream();

  Future<void> delete(String journalId);
  Future post(Mood mood);
}