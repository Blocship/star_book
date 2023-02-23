import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/shared/form_models/jounral_form_model.dart';

class JournalEditCubit extends Cubit<CubitState<Journal>> {
  final GlobalKey<FormBuilderState>? formKey;
  final JournalRepo journalRepo;
  JournalEditCubit(this.formKey, this.journalRepo)
      : super(const InitialState());

  Future<void> updateJournal({required String journalId}) async {
    formKey?.currentState?.save();
    if (formKey?.currentState?.validate() ?? false) {
      final journalFormData =
          JournalFormModel.fromJson(formKey!.currentState!.value);
      emit(const LoadingState());
      await journalRepo.updateJournal(
        Journal(
          id: journalId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),

          /// TODO: Change it to this line after journal Detail Cubit PR merged
          ///Mood.initial() => journalFormData.mood,
          mood: Mood.initial(),
          title: journalFormData.title,
          memo: journalFormData.memo,
        ),
      );
    }
  }
}
