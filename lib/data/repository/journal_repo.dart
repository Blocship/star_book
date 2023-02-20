import 'package:star_book/data/data_source/local_data_source/journal_api.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/repository/journal_repo.dart';

class JournalRepoImpl implements JournalRepo {
  final IJournalApi lsJournalApi;

  JournalRepoImpl({required this.lsJournalApi});

  @override
  Future<void> initialize() async {}

  // Stream for journals of a month

  @override
  Stream<Journal?> journalById$(String journalId) {
    return lsJournalApi.streamById(journalId).map<Journal?>((event) {
      if (event == null) {
        return null;
      } else {
        return Journal.fromLSJournal(event);
      }
    });
  }

  @override
  Stream<List<Journal>> journalsByDay$(DateTime day) {
    return lsJournalApi.streamByDay(day).map((event) {
      return event.map((e) => Journal.fromLSJournal(e)).toList();
    });
  }

  @override
  Future<void> addJournal(Journal journal) async {
    await lsJournalApi.create(journal.toLSJournal);
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

  @override
  Future<void> deleteJournal(String journalId) async {
    await lsJournalApi.delete(journalId);
  }

  @override
  Future<List<Journal>> getJournalByDay(DateTime day) {
    return lsJournalApi.fetchByDate(day).then((value) {
      return value.map((e) => Journal.fromLSJournal(e)).toList();
    });
  }

  @override
  Future<List<Journal>> getJournalByMonth(int month, int year) {
    return lsJournalApi.getJournalByMonth(month, year).then((value) {
      return value.map((e) => Journal.fromLSJournal(e)).toList();
    });
  }

  @override
  Future<List<Journal>> getJournalByRange(DateTime start, DateTime end) {
    return lsJournalApi.getJournalByRange(start, end).then((value) {
      return value.map((e) => Journal.fromLSJournal(e)).toList();
    });
  }

  @override
  Future<List<Journal>> getJournalByYear(int year) {
    return lsJournalApi.getJournalByYear(year).then((value) {
      return value.map((e) => Journal.fromLSJournal(e)).toList();
    });
  }

  @override
  Future<int> point() {
    return lsJournalApi.point();
  }

  @override
  Future<int> streak() {
    return lsJournalApi.streak();
  }
}
