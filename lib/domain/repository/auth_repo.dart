import 'package:star_book/domain/repository/base_repo.dart';

abstract class AuthRepo extends BaseRepo {
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
}
