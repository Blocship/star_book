import 'package:isar/isar.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/utils/utils.dart';

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
  final IsarCollection<Mood> collection;
  LSMoodApi({required this.collection});

  @override
  Future<void> create(Mood mood) async {
    await collection.isar.writeTxn(() async {
      await collection.put(mood);
    });
    return;
  }

  @override
  Future<Mood> fetchById(String moodId) async {
    late final Mood mood;
    await collection.isar.txn(() async {
      final data = await collection.get(moodId.fnvHash);
      // todo if data is null throw error
      mood = data!;
    });
    return mood;
  }

  @override
  Future<List<Mood>> fetchAll() async {
    late final List<Mood> list;
    await collection.isar.txn(() async {
      list = await collection.where().findAll();
    });
    return list;
  }

  @override
  Future<void> update(Mood mood) async {
    await collection.isar.writeTxn(() async {
      await collection.put(mood);
    });
  }

  @override
  Future<void> delete(String moodId) async {
    await collection.isar.writeTxn(() async {
      await collection.delete(moodId.fnvHash);
      // todo: check: if deleted good else throw
    });
    return;
  }
}
