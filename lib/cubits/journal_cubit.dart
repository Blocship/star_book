import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/shared/form_models/jounral_form_model.dart';

class JournalCubit extends Cubit<CubitState> {
  final GlobalKey<FormBuilderState>? formKey;
  final JournalRepo journalRepo;
  StreamSubscription? journalStream;

  JournalCubit(this.formKey, {required this.journalRepo})
      : super(const InitialState());

  /// I don't think so we need [UpdateJournal] we can use
  /// post journal for update journal
  ///
  /// Just add id in post journal as parameter
  /// by using this id we can post new journal or
  /// just replaced the previous journal
  /// by this:
  /// id: id ?? IdGenerator,

  Future<void> postJournal() async {
    formKey?.currentState?.save();
    if (formKey?.currentState?.validate() ?? false) {
      final journalFormData =
          JournalFormModel.fromJson(formKey!.currentState!.value);
      emit(const LoadingState());
      await journalRepo.addJournal(
        Journal(
          id: 'id',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          mood: journalFormData.mood,
          title: journalFormData.title,
          memo: journalFormData.memo,
        ),
      );
    }
  }

  Future<void> deleteJournal({required String journalId}) async {
    emit(const LoadingState());
    await journalRepo.deleteJournal(journalId);
  }

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

  Future<void> getStreak() async {
    emit(const LoadingState());
    await journalRepo.streak();
  }

  Future<void> getPoint() async {
    emit(const LoadingState());
    await journalRepo.point();
  }

  /// Journal Stream
  /// Didn't get the concept of stream of journal by id
  Future<void> journalById$({required DateTime dateTime}) async {
    journalStream = journalRepo.journalsByDay$(dateTime).listen((journals) {
      journals.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });

      /// Need to create JournalState for stream?
      /// like in QT
    });
  }

  @override
  Future<void> close() async {
    await journalStream?.cancel();
    return super.close();
  }
}
