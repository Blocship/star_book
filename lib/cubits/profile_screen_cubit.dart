import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/domain/repository/journal_repo.dart';

class ProfileScreenCubit extends Cubit<CubitState<Journal>> {
  JournalRepo journalRepo;
  ProfileScreenCubit({required this.journalRepo}) : super(const InitialState());

  Future<void> getStreak() async {
    emit(const LoadingState());
    await journalRepo.streak();
  }

  Future<void> getPoint() async {
    emit(const LoadingState());
    await journalRepo.point();
  }
}
