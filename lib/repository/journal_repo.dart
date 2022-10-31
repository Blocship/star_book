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
}
