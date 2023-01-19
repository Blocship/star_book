import 'package:star_book/domain/models/user/user.dart';
import 'package:star_book/domain/repository/base_repo.dart';

abstract class UserRepo extends BaseRepo {
  Future<User> getUser({required String userId});
  Future<void> deleteUser(String userId);
}
