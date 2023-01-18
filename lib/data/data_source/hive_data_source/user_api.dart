import 'package:star_book/data/data_source/hive_data_source/base_api.dart';
import 'package:star_book/data/models/user/user.dart';
import 'package:star_book/data/packages/hive_collection.dart';

abstract class IUserApi extends BaseApi {
  static const String collectionName = 'userCollection';
  Future<void> create(User user);
  Future<User> fetchUser(String uuid);
  Future<void> update(User user);
  Future<void> delete(String uuid);
}

class LSUserApi extends IUserApi {
  final HiveCollectionReference<User> collection;
  LSUserApi({required this.collection});

  @override
  Future<void> create(User user) async {
    UnimplementedError('User cannot be created locally');
  }

  @override
  Future<User> fetchUser(String uuid) async {
    return collection.doc(uuid)!.get();
  }

  @override
  Future<void> update(User user) async {
    await collection.doc(user.id)!.set(user);
  }

  @override
  Future<void> delete(String uuid) async {
    await collection.doc(uuid)!.delete();
  }
}
