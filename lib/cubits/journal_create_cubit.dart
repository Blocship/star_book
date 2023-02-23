import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/shared/form_models/jounral_form_model.dart';

class JournalCreateCubit extends Cubit<CubitState<Journal>> {
  final GlobalKey<FormBuilderState> formKey;
  final JournalRepo journalRepo;

  JournalCreateCubit({required this.journalRepo, required this.formKey})
      : super(const InitialState());

  Future<void> addJournal() async {
    formKey.currentState?.save();
    if (formKey.currentState?.validate() ?? false) {
      final formData = JournalFormModel.fromJson(formKey.currentState!.value);
      emit(const LoadingState());
      await journalRepo.addJournal(
        Journal(
          id: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          mood: formData.mood,
          title: formData.title,
          memo: formData.memo,
        ),
      );
    }
  }
}
