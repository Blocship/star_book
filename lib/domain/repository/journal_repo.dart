import 'package:star_book/domain/models/journal/journal.dart';

import 'base_repo.dart';

abstract class JournalRepo extends BaseRepo {
  Stream<Journal?> journalById$(String journalId);
  Stream<List<Journal>> journalsByDay$(DateTime day);
  Future<void> addJournal(Journal journal);
  Future<Journal> getJournalById(String journalId);
  Future<List<Journal>> getJournals();
  Future<void> updateJournal(Journal journal);
  Future<void> deleteJournal(String journalId);
}
