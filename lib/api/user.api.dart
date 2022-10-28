import 'package:star_book/api/base.api.dart';
import 'package:star_book/models/user/user.dart';
import 'package:star_book/packages/hive_collection.dart';

abstract class IUserApi extends BaseApi {
  static const String collectionName = 'userCollection';
  Future<void> createUser(User user);
  Future<User> getUser(String uuid);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String uuid);
}

class LSUserApi extends IUserApi {
  final HiveCollectionReference<User> collection;
  LSUserApi({required this.collection});

  /// not in use
  @override
  Future<void> createUser(User user) async {
    UnimplementedError('User cannot be created locally');
  }

  @override
  Future<User> getUser(String uuid) async {
    return collection.doc(uuid)!.get();
  }

  @override
  Future<void> updateUser(User user) async {
    await collection.doc(user.id)!.set(user);
  }

  @override
  Future<void> deleteUser(String uuid) async {
    await collection.doc(uuid)!.delete();
  }
}
