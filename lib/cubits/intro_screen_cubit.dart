import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/user/user.dart';
import 'package:star_book/domain/repository/user_repo.dart';

class IntroScreenCubit extends Cubit<CubitState<User>> {
  final GlobalKey<FormBuilderState> formKey;
  final UserRepo userRepo;

  IntroScreenCubit({required this.formKey, required this.userRepo})
      : super(const InitialState());

  Future<void> createUser() async {
    formKey.currentState?.save();
    if (formKey.currentState?.validate() ?? false) {
      final formData = formKey.currentState!.value;
      emit(const LoadingState());
      await userRepo.createUser(
        User(
          id: '',
          name: formData.values.first,
        ),
      );
    }
  }

  Future<void> deleteUser({required String userId}) async {
    emit(const LoadingState());
    await userRepo.deleteUser(userId);
  }

  Future<void> updateUser({required String userId}) async {
    final formData = formKey.currentState!.value;
    emit(const LoadingState());
    await userRepo.updateUser(User(id: '', name: formData.values.first));
  }

  Future<void> getUser({required String userId}) async {
    emit(const LoadingState());
    await userRepo.getUser(userId: userId);
  }
}
