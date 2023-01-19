import 'package:star_book/data/data_source/local_data_source/user_api.dart';
import 'package:star_book/domain/models/user/user.dart';
import 'package:star_book/domain/repository/user_repo.dart';

class UserRepoImpl implements UserRepo {
  late final IUserApi lSUserApi;

  @override
  Future<void> initialize() async {}

  @override
  Future<User> getUser({required String userId}) async {
    final user = await lSUserApi.fetch(userId);
    return User.fromLSUser(user);
  }

  @override
  Future<void> deleteUser(String userId) async {
    await lSUserApi.delete(userId);
  }
}
