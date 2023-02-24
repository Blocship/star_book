import 'package:isar/isar.dart';
import 'package:star_book/data/data_source/local_data_source/base_api.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/utils/datetime.dart';
import 'package:star_book/data/utils/utils.dart';

abstract class IJournalApi extends BaseApi {
  static const String collectionName = 'journalCollection';
  Stream<Journal?> streamById(String journalId);
  Stream<List<Journal>> streamByDay(DateTime day);
  Future<void> create(JournalBody journal);
  Future<List<Journal>> fetchAll();
  Future<Journal> fetchById(String journalId);
  Future<List<Journal>> fetchByMood(String moodId);
  Future<List<Journal>> fetchByDate(DateTime day);
  Future<List<Journal>> getJournalByMonth(int month, int year);
  Future<List<Journal>> getJournalByYear(int year);
  Future<List<Journal>> getJournalByRange(DateTime start, DateTime end);
  Future<void> update(String id, JournalBody journal);
  Future<void> delete(String journalId);
  Future<int> streak();
  Future<int> point();
}

class LSJournalApi implements IJournalApi {
  final IsarCollection<Journal> journalCollection;
  final IsarCollection<Mood> moodCollection;

  LSJournalApi({
    required this.journalCollection,
    required this.moodCollection,
  });

  @override
  Future<void> create(JournalBody journal) async {
    assert(journal.createdAt != null, 'createdAt must not be null');
    // check that mood is already created and exists in database
    final mood = await moodCollection.get(journal.mood.id.fnvHash);
    assert(mood != null, 'mood must be created before creating journal');
    final newJournal = Journal(
      id: Util.uid,
      createdAt: journal.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
      title: journal.title,
      memo: journal.memo,
    );
    await journalCollection.isar.writeTxn(() async {
      await journalCollection.put(newJournal);
      await moodCollection.put(newJournal.mood);
      await newJournal.moodRelation.save();
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
  Future<void> update(String id, JournalBody journal) async {
    assert(journal.createdAt == null, 'createdAt must be null');
    final oldJournal = await fetchById(id);
    final newJournal = Journal(
      id: oldJournal.id,
      createdAt: oldJournal.createdAt,
      updatedAt: DateTime.now(),
      title: journal.title,
      memo: journal.memo,
    );
    await journalCollection.isar.writeTxn(() async {
      await journalCollection.put(newJournal);
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

  @override
  Future<List<Journal>> getJournalByMonth(int month, int year) async {
    final start = DateTime(year, month, 1).startTimeofDay;
    final end = DateTime(year, month + 1, 0).endTimeofDay;
    return getJournalByRange(start, end);
  }

  @override
  Future<List<Journal>> getJournalByRange(DateTime start, DateTime end) async {
    late final List<Journal> list;
    await journalCollection.isar.txn(() async {
      list = await journalCollection
          .where()
          .createdAtBetween(
            start,
            end,
            includeLower: true,
            includeUpper: true,
          )
          .findAll();
    });
    return list;
  }

  @override
  Future<List<Journal>> getJournalByYear(int year) async {
    final start = DateTime(year, 1, 1).startTimeofDay;
    final end = DateTime(year, 12, 31).endTimeofDay;
    return getJournalByRange(start, end);
  }

  // total number of journals created
  @override
  Future<int> point() async {
    return journalCollection.count();
  }

  // number of consecutive days journals created
  @override
  Future<int> streak() async {
    final list = await fetchAll();
    if (list.isEmpty) return 0;
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    final now = DateTime.now();
    DateTime prev = now;
    for (int i = 0; i < list.length; i++) {
      final current = list[i].createdAt;
      if (current.difference(prev).inHours > 24) {
        return prev.difference(now).inDays;
      }
      prev = current;
    }
    return prev.difference(now).inDays;
  }
}
