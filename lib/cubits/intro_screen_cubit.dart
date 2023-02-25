import 'dart:developer';

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

  Future<void> createUser(String name) async {
    try {
      emit(const LoadingState());
      await userRepo.createUser(
        User(
          id: '',
          name: name,
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteUser({required String userId}) async {
    emit(const LoadingState());
    await userRepo.deleteUser(userId);
  }

  Future<void> updateUser({required String name}) async {
    emit(const LoadingState());
    await userRepo.updateUser(User(id: '', name: name));
  }

  Future<void> getUser({required String userId}) async {
    emit(const LoadingState());
    await userRepo.getUser(userId: userId);
  }
}
