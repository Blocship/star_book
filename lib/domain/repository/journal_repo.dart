import 'package:star_book/domain/models/journal/journal.dart';

import 'base_repo.dart';

abstract class JournalRepo extends BaseRepo {
  Stream<Journal?> journalById$(String journalId);
  Stream<List<Journal>> journalsByDay$(DateTime day);
  Future<void> addJournal(Journal journal);
  Future<List<Journal>> getJournals();
  Future<Journal> getJournalById(String journalId);
  Future<List<Journal>> getJournalByDay(DateTime day);
  Future<List<Journal>> getJournalByMonth(int month, int year);
  Future<List<Journal>> getJournalByYear(int year);
  Future<List<Journal>> getJournalByRange(DateTime start, DateTime end);
  Future<void> updateJournal(Journal journal);
  Future<void> deleteJournal(String journalId);
  Future<int> streak();
  Future<int> point();
}
