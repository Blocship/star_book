import 'package:isar/isar.dart';
import 'package:star_book/data/data_source/local_data_source/base_api.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/data/utils/datetime.dart';
import 'package:star_book/data/utils/utils.dart';

abstract class IJournalApi extends BaseApi {
  static const String collectionName = 'journalCollection';
  Future<void> create(Journal journal);
  Future<List<Journal>> fetchAll();
  Future<Journal> fetchById(String journalId);
  Future<List<Journal>> fetchByMood(String moodId);
  Future<List<Journal>> fetchByDate();
  Future<void> update(Journal journal);
  Future<void> delete(String journalId);
  Stream<Journal?> streamById(String journalId);
  Stream<List<Journal>> streamByDay(DateTime day);
}

class LSJournalApi implements IJournalApi {
  final IsarCollection<Journal> collection;

  LSJournalApi({
    required this.collection,
  });

  @override
  Future<void> create(Journal journal) async {
    await collection.isar.writeTxn(() async {
      await collection.put(journal);
    });
    return;
  }

  @override
  Future<List<Journal>> fetchAll() async {
    late final List<Journal> list;
    await collection.isar.txn(() async {
      list = await collection.where().findAll();
    });
    return list;
  }

  @override
  Future<Journal> fetchById(String journalId) async {
    late final Journal journal;
    await collection.isar.txn(() async {
      final data = await collection.get(journalId.fnvHash);
      // todo if data is null throw error
      journal = data!;
    });
    return journal;
  }

  @override
  Future<List<Journal>> fetchByMood(String moodId) {
    // TODO: implement fetchByMood
    throw UnimplementedError();
  }

  @override
  Future<List<Journal>> fetchByDate() async {
    late final List<Journal> list;
    await collection.isar.txn(() async {
      list = await collection
          .where()
          // todo , add right dates
          .createdAtBetween(DateTime.now(), DateTime.now())
          .findAll();
    });
    return list;
  }

  @override
  Future<void> update(Journal journal) async {
    await collection.isar.writeTxn(() async {
      await collection.put(journal);
    });
  }

  @override
  Future<void> delete(String journalId) async {
    await collection.isar.writeTxn(() async {
      await collection.delete(journalId.fnvHash);
      // todo: check: if deleted good else throw
    });
    return;
  }

  @override
  Stream<Journal?> streamById(String journalId) =>
      collection.watchObject(journalId.fnvHash, fireImmediately: true);

  @override
  Stream<List<Journal>> streamByDay(DateTime day) {
    final query = collection
        .filter()
        .createdAtBetween(
          day.startTimeofDay,
          day.endTimeofDay,
          includeLower: true,
          includeUpper: true,
        )
        .build();
    return query.watch(fireImmediately: true);
  }
}
