import 'package:star_book/data/data_source/hive_data_source/base_api.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/data/packages/hive_collection.dart';

abstract class IJournalApi extends BaseApi {
  static const String collectionName = 'journalCollection';
  Future<void> create(Journal journal);
  Future<List<Journal>> fetchAll();
  Future<Journal> fetchById(String journalId);
  Future<List<Journal>> fetchByMood(String moodId);
  Future<List<Journal>> fetchByDate();
  Future<void> update(Journal journal);
  Future<void> delete(String journalId);
}

class LSJournalApi implements IJournalApi {
  final HiveCollectionReference<Journal> collection;
  LSJournalApi({required this.collection});

  @override
  Future<void> create(Journal journal) async {
    await collection.add(journal);
    return;
  }

  @override
  Future<List<Journal>> fetchAll() async {
    return collection.docs().map((e) => e.get()).toList();
  }

  @override
  Future<Journal> fetchById(String journalId) async {
    return collection.doc(journalId)!.get();
  }

  @override
  Future<List<Journal>> fetchByDate() async {
    // TODO: implement fetchByDate
    throw UnimplementedError();
  }

  @override
  Future<List<Journal>> fetchByMood(String moodId) async {
    // TODO: implement fetchByMood
    throw UnimplementedError();
  }

  @override
  Future<void> update(Journal journal) async {
    return collection.doc(journal.id)!.set(journal);
  }

  @override
  Future<void> delete(String journalId) async {
    return collection.doc(journalId)!.delete();
  }
}
