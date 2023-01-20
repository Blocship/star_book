import 'package:isar/isar.dart';
import 'package:star_book/data/data_source/local_data_source/base_api.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/utils/datetime.dart';
import 'package:star_book/data/utils/utils.dart';

abstract class IJournalApi extends BaseApi {
  static const String collectionName = 'journalCollection';
  Future<void> create(Journal journal);
  Future<List<Journal>> fetchAll();
  Future<Journal> fetchById(String journalId);
  Future<List<Journal>> fetchByMood(String moodId);
  Future<List<Journal>> fetchByDate(DateTime day);
  Future<void> update(Journal journal);
  Future<void> delete(String journalId);
  Stream<Journal?> streamById(String journalId);
  Stream<List<Journal>> streamByDay(DateTime day);
}

class LSJournalApi implements IJournalApi {
  final IsarCollection<Journal> journalCollection;
  final IsarCollection<Mood> moodCollection;

  LSJournalApi({
    required this.journalCollection,
    required this.moodCollection,
  });

  @override
  Future<void> create(Journal journal) async {
    await journalCollection.isar.writeTxn(() async {
      await journalCollection.put(journal);
      await moodCollection.put(journal.mood);
      await journal.moodRelation.save();
    });
    return;
  }

  @override
  Future<List<Journal>> fetchAll() async {
    late final List<Journal> list;
    await journalCollection.isar.txn(() async {
      list = await journalCollection.where().findAll();
    });
    return list;
  }

  @override
  Future<Journal> fetchById(String journalId) async {
    late final Journal journal;
    await journalCollection.isar.txn(() async {
      final data = await journalCollection.get(journalId.fnvHash);
      // todo if data is null throw error
      journal = data!;
    });
    return journal;
  }

  @override
  Future<List<Journal>> fetchByMood(String moodId) {
    // TODO: implement fetchByMood
    // create this in mood api
    // use back linking given by isar
    throw UnimplementedError();
  }

  @override
  Future<List<Journal>> fetchByDate(DateTime day) async {
    late final List<Journal> list;
    await journalCollection.isar.txn(() async {
      list = await journalCollection
          .where()
          .createdAtBetween(
            day.startTimeofDay,
            day.endTimeofDay,
            includeLower: true,
            includeUpper: true,
          )
          .findAll();
    });
    return list;
  }

  @override
  Future<void> update(Journal journal) async {
    await journalCollection.isar.writeTxn(() async {
      await journalCollection.put(journal);
    });
  }

  @override
  Future<void> delete(String journalId) async {
    await journalCollection.isar.writeTxn(() async {
      await journalCollection.delete(journalId.fnvHash);
      // todo: check: if deleted good else throw
    });
    return;
  }

  @override
  Stream<Journal?> streamById(String journalId) =>
      journalCollection.watchObject(journalId.fnvHash, fireImmediately: true);

  @override
  Stream<List<Journal>> streamByDay(DateTime day) {
    final query = journalCollection
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
