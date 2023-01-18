import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/packages/hive_collection.dart';

import 'base_api.dart';

abstract class IMoodApi extends BaseApi {
  static const String collectionName = 'moodCollection';
  Future<void> create(Mood mood);
  Future<List<Mood>> fetchAll();
  Future<Mood> fetchById(String moodId);
  Future<void> update(Mood mood);
  Future<void> delete(String moodId);
}

class LSMoodApi implements IMoodApi {
  final HiveCollectionReference<Mood> collection;
  LSMoodApi({required this.collection});

  @override
  Future<void> create(Mood mood) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Mood> fetchById(String moodId) async {
    return collection.doc(moodId)!.get();
  }

  @override
  Future<List<Mood>> fetchAll() async {
    return collection.docs().map((e) => e.get()).toList();
  }

  @override
  Future<void> update(Mood mood) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String moodId) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
