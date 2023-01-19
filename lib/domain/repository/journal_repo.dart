import 'package:star_book/domain/models/journal/journal.dart';

import 'base_repo.dart';

abstract class JournalRepo extends BaseRepo {
  Future<List<Journal>> getJournals();
  Future<void> deleteJournal(String journalId);
  Future<void> updateJournal(Journal journal);
  Future<void> addJournal(Journal journal);
  Future<Journal> getJournalById(String journalId);
}
