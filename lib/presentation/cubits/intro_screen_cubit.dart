import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/domain/models/user/user.dart';
import 'package:star_book/domain/repository/user_repo.dart';
import 'package:star_book/presentation/cubits/cubit_state/cubit_state.dart';

class IntroScreenCubit extends Cubit<CubitState<User>> {
  final GlobalKey<FormBuilderState> formKey;
  final UserRepo userRepo;

  IntroScreenCubit({required this.formKey, required this.userRepo})
      : super(const InitialState());

  Future<void> createUser(String name) async {
    try {
      emit(const LoadingState());
      final body = UserBody(name: name);
      await userRepo.createUser(body);
    } catch (e) {
      log(e.toString());
    }
  }
}
