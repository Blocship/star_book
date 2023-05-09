import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/shared/form_models/jounral_form_model.dart';

class JournalEditCubit extends Cubit<CubitState<Journal>> {
  final GlobalKey<FormBuilderState> formKey;
  final JournalRepo journalRepo;
  StreamSubscription<Journal?>? journalStream;

  JournalEditCubit({required this.formKey, required this.journalRepo})
      : super(const InitialState());

  Future<void> updateJournal({required String journalId}) async {
    formKey.currentState?.save();
    if (formKey.currentState?.validate() ?? false) {
      final formData = JournalFormModel.fromJson(formKey.currentState!.value);
      emit(const LoadingState());
      final journalBody = JournalBody(
        mood: formData.mood ?? Mood.initial(),
        title: formData.title,
        memo: formData.memo,
      );
      await journalRepo.updateJournal(journalId, journalBody);
    }
  }

  /// Journal Stream by Id
  Future<void> journalById$({required String journalId}) async {
    journalStream = journalRepo.journalById$(journalId).listen((journal) {
      emit(LoadedState(journal ?? Journal.initial()));
    });
  }

  @override
  Future<void> close() async {
    await journalStream?.cancel();
    return super.close();
  }
}
