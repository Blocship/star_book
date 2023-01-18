import 'package:star_book/data/data_source/hive_data_source/user_api.dart';
import 'package:star_book/data/models/user/user.dart';
import 'package:star_book/data/packages/hive_collection.dart';
import 'package:star_book/domain/repository/user_repo.dart';

class UserRepoImpl implements UserRepo {
  late final LSUserApi lSUserApi;
  late final HiveCollectionReference<User> _userCollection;

  @override
  Future<void> initialize() async {
    _userCollection =
        await HiveStore.instance.collection<User>(IUserApi.collectionName);
    lSUserApi = LSUserApi(collection: _userCollection);
  }

  @override
  Future<User> getUser({required String userId}) async {
    final user = await lSUserApi.fetchUser(userId);
    return user;
  }

  @override
  Future<void> deleteUser(String userId) async {
    lSUserApi.delete(userId);
  }
}
