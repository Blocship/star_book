import 'package:star_book/data/data_source/local_data_source/journal_api.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/repository/journal_repo.dart';

class JournalRepoImpl implements JournalRepo {
  late final IJournalApi lsJournalApi;

  @override
  Future<void> initialize() async {}

  @override
  Future<void> addJournal(Journal journal) async {
    await lsJournalApi.create(journal.toLSJournal);
  }

  @override
  Future<void> deleteJournal(String journalId) async {
    await lsJournalApi.delete(journalId);
  }

  @override
  Future<Journal> getJournalById(String journalId) async {
    final journal = await lsJournalApi.fetchById(journalId);
    return Journal.fromLSJournal(journal);
  }

  @override
  Future<List<Journal>> getJournals() async {
    final journals = await lsJournalApi.fetchAll();
    List<Journal> list = [];
    for (var journal in journals) {
      list.add(Journal.fromLSJournal(journal));
    }
    return list;
  }

  @override
  Future<void> updateJournal(Journal journal) async {
    await lsJournalApi.update(journal.toLSJournal);
  }
}
