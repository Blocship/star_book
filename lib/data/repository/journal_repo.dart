import 'package:star_book/data/data_source/hive_data_source/journal_api.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/data/packages/hive_collection.dart';
import 'package:star_book/domain/repository/journal_repo.dart';

class JournalRepoImpl implements JournalRepo {
  late final LSJournalApi lsJournalApi;

  late final HiveCollectionReference<Journal> _journalCollection;

  @override
  Future<void> initialize() async {
    _journalCollection = await HiveStore.instance
        .collection<Journal>(IJournalApi.collectionName);
    lsJournalApi = LSJournalApi(collection: _journalCollection);
  }

  @override
  Future<List<Journal>> getJournals() async {
    return lsJournalApi.fetchAll();
  }

  @override
  Future<void> deleteJournal(String journalId) async {
    await lsJournalApi.delete(journalId);
  }

  @override
  Future<void> updateJournal(Journal journal) async {
    await lsJournalApi.update(journal);
  }

  @override
  Future<void> addJournal(Journal journal) async {
    return lsJournalApi.create(journal);
  }

  @override
  Future<Journal> getById(String journalId) async {
    return lsJournalApi.fetchById(journalId);
  }
}
