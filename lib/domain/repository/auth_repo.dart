import 'package:star_book/domain/models/user/user.dart';
import 'package:star_book/domain/repository/base_repo.dart';

abstract class AuthRepo extends BaseRepo {
  Future<bool> isSignedIn();
  Future<User> getUser();
}
