import 'package:flutter/material.dart';
import 'package:star_book/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final IAuthApi lSAuthApi;
  @override
  Future<String> getUser() {}

  @override
  Future<void> initialize() {}

  @override
  Future<bool> isSignedIn() {}

  @override
  Future<void> signIn({required String email, required String password}) {}

  @override
  Future<void> signOut() {}

  @override
  Future<void> signUp({required String email, required String password}) {}
}













}