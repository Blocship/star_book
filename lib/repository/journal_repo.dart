import '../api/journal_api.dart';
import '../models/journal/journal.dart';
import '../packages/hive_collection.dart';
import 'base.repo.dart';

class JournalRepo extends BaseRepo {
  late final LSJournalApi lsJournalApi;

  late final HiveCollectionReference<Journal> _journalCollection;

  JournalRepo();
  Future<void> initialize() async {
    _journalCollection = await HiveStore.instance.collection<Journal>(IJournalApi.collectionName);
    lsJournalApi = LSJournalApi(collection: _journalCollection);
  }

  Future<List<Journal>> getJournals() async {
    List<Journal> journals;
    journals = await lsJournalApi.getAll();
    return journals;
  }

  Future<void> deleteJournal(String journalId) async {
    await lsJournalApi.delete(journalId);
  }

  Future postJournal(Journal journal) async {
    await lsJournalApi.post(journal);
  }

  void populateJournals(Iterable<Journal> journals) {
    _journalCollection.addAll(journals);
  }

  void populateJournal(Journal journal) {
    _journalCollection.add(journal);
  }
}
