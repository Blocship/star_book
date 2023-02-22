import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';

class JournalCubit extends Cubit<CubitState> {
  // final GlobalKey<FormBuilderState>? formKey;

  JournalCubit() : super(const InitialState());
}
