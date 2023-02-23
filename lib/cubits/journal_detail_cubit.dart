import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/repository/journal_repo.dart';

class JournalDetailCubit extends Cubit<CubitState> {
  final JournalRepo journalRepo;
  StreamSubscription? journalStream;

  JournalDetailCubit({required this.journalRepo}) : super(const InitialState());

  Future<void> fetchJournals() async {
    emit(const LoadingState());
    await journalRepo.getJournals();
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

  @override
  Future<void> close() async {
    await journalStream?.cancel();
    return super.close();
  }
}
