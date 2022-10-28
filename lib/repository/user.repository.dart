import 'package:star_book/api/user.api.dart';
import 'package:star_book/models/user/user.dart';
import 'package:star_book/packages/hive_collection.dart';
import 'package:star_book/repository/base.repository.dart';

class UserRepository extends BaseRepo {
  late final LSUserApi lSUserApi;

  late final HiveCollectionReference<User> _userCollection;

  @override
  Future<void> initialize() async {
    _userCollection = await HiveStore.instance.collection<User>(IUserApi.collectionName);
    lSUserApi = LSUserApi(collection: _userCollection);
  }

  Future<void> createUser(User user) async {
    populateUser(user);
  }

  Future<User> getUser({required String userId}) async {
    late User user;

    user = await lSUserApi.getUser(userId);

    return user;
  }

  Future<void> updateUser(User user) async {
    populateUser(user);
  }

  Future<void> deleteUser(String userId) async {
    lSUserApi.deleteUser(userId);
  }

  void populateUser(User user) {
    _userCollection.add(user);
  }
}
