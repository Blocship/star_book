import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/journal_state.dart';
import 'package:star_book/domain/repository/journal_repo.dart';

class JournalDetailCubit extends Cubit<CubitState> {
  final GlobalKey<FormBuilderState>? formKey;
  final JournalRepo journalRepo;
  StreamSubscription? journalStream;

  JournalDetailCubit(this.formKey, {required this.journalRepo})
      : super(const InitialState());
  Future<void> fetchJournals() async {
    emit(const LoadingState());
    await journalRepo.getJournals();
  }

  Future<void> getJournalById({required String journalId}) async {
    emit(const LoadingState());
    await journalRepo.getJournalById(journalId);
  }

  Future<void> getJournalByDay({required DateTime dateTime}) async {
    emit(const LoadingState());
    await journalRepo.getJournalByDay(dateTime);
  }

  /// [getJournalByMonth] can also be done in this way:
  ///
  /// Future<void> getJournalByMonth(DateTime dateTime) async {
  ///     emit(const LoadingState());
  ///     await journalRepo.getJournalByMonth(dateTime.month, dateTime.year);
  ///   }
  ///
  Future<void> getJournalByMonth(
      {required int month, required int year}) async {
    emit(const LoadingState());
    await journalRepo.getJournalByMonth(month, year);
  }

  /// [getJournalByYear] can also be done in this way:
  ///
  /// Future<void> getJournalByYear(DateTime dateTime) async {
  ///     emit(const LoadingState());
  ///     await journalRepo.getJournalByYear(dateTime.year);
  ///   }

  Future<void> getJournalByYear({required int year}) async {
    emit(const LoadingState());
    await journalRepo.getJournalByYear(year);
  }

  Future<void> getJournalByRange(
      {required DateTime start, required DateTime end}) async {
    emit(const LoadingState());
    await journalRepo.getJournalByRange(start, end);
  }

  Future<void> deleteJournal({required String journalId}) async {
    emit(const LoadingState());
    await journalRepo.deleteJournal(journalId);
  }

  /// Journal Stream by Id
  Future<void> journalById$({required String journalId}) async {
    journalStream =
        journalRepo.journalById$(journalId).listen((journal) => journal);
    emit(LoadedState(journalStream));
  }

  /// Journal Stream by Day
  Future<void> journalByDay$({required DateTime dateTime}) async {
    journalStream = journalRepo.journalsByDay$(dateTime).listen((journals) {
      journals.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
      emit(LoadedState(
          JournalState(journals: List.of(journals), selectedDate: dateTime)));
    });
  }

  @override
  Future<void> close() async {
    await journalStream?.cancel();
    return super.close();
  }
}
