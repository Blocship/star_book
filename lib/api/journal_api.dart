import 'package:star_book/api/base_api.dart';
import 'package:star_book/models/journal/journal.dart';
import 'package:star_book/packages/hive_collection.dart';

abstract class IJournalApi extends BaseApi {
  static const String collectionName = 'journalCollection';
  Future<List<Journal>> getAll();
  Future<Journal> getById(String journalId);
  Future<void> delete(String journalId);
  Future post(Journal journal);
}

class LSJournalApi extends IJournalApi {
  final HiveCollectionReference<Journal> collection;
  LSJournalApi({required this.collection});

  @override
  Future<Journal> getById(String journalId) async {
    return collection.doc(journalId)!.get();
  }

  @override
  Future<List<Journal>> getAll() async {
    return collection.docs().map((e) => e.get()).toList();
  }

  @override

  Future<void> delete(String journalId) async {
    await collection.doc(journalId)!.delete();
  }

  @override
  Future post(Journal journal) async {
    await collection.add(journal);

  }
}
