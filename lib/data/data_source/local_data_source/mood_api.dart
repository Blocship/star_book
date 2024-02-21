import 'package:isar/isar.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/utils/utils.dart';

import 'base_api.dart';

abstract class IMoodApi extends BaseApi {
  static const String collectionName = 'moodCollection';
  Future<void> create(MoodBody mood);
  Future<List<Mood>> fetchAll();
  Future<Mood> fetchById(String moodId);
  Future<void> update(String id, MoodBody mood);
  Future<void> delete(String moodId);
}

class LSMoodApi implements IMoodApi {
  final IsarCollection<Mood> collection;
  LSMoodApi({required this.collection});

  @override
  Future<void> create(MoodBody mood) async {
    final newMood = Mood(
      id: Util.uid,
      label: mood.label,
      color: mood.color,
    );
    await collection.isar.writeTxn(() async {
      await collection.put(newMood);
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
  Future<void> update(String id, MoodBody mood) async {
    // mood should exist todo, later improve it
    final oldMood = await fetchById(id);
    final newMood = Mood(
      id: oldMood.id,
      label: mood.label,
      color: mood.color,
    );
    await collection.isar.writeTxn(() async {
      await collection.put(newMood);
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
