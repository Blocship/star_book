import 'package:star_book/models/mood/mood.dart';

import '../packages/hive_collection.dart';
import 'base_api.dart';

abstract class IMoodApi extends BaseApi {
  static const String collectionName = 'moodCollection';

  Future<List<Mood>> getAll();
}

class LSMoodApi extends IMoodApi {
  final HiveCollectionReference<Mood> collection;
  LSMoodApi({required this.collection});

  @override
  Future<List<Mood>> getAll() async {
    return collection.docs().map((e) => e.get()).toList();
  }
}
