import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/domain/repository/journal_repo.dart';

import 'cubit_state/cubit_state.dart';
import 'journal_state.dart';

class JournalListCubit extends Cubit<CubitState<JournalState>> {
  final JournalRepo journalRepo;
  StreamSubscription? journalStream;

  JournalListCubit({required this.journalRepo}) : super(const InitialState());

  /// We can move it to new Cubit JournalList
  Future<void> getJournalByDate({required DateTime dateTime}) async {
    emit(const LoadingState());
    journalStream = journalRepo.journalsByDay$(dateTime).listen((journals) {
      journals.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
      emit(LoadedState(JournalState(journals: List.of(journals))));
    });
  }

  @override
  Future<void> close() async {
    await journalStream?.cancel();
    return super.close();
  }
}
