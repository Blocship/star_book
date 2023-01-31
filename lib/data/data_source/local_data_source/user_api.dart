import 'package:isar/isar.dart';
import 'package:star_book/data/data_source/local_data_source/base_api.dart';
import 'package:star_book/data/models/user/user.dart';
import 'package:star_book/data/utils/utils.dart';

abstract class IUserApi extends BaseApi {
  static const String collectionName = 'userCollection';
  Future<void> create(User user);
  Future<User> fetch(String uuid);
  Future<void> update(User user);
  Future<void> delete(String uuid);
}

class LSUserApi extends IUserApi {
  final IsarCollection<User> collection;
  LSUserApi({required this.collection});

  @override
  Future<void> create(User user) async {
    await collection.isar.writeTxn(() async {
      await collection.put(user);
    });
    return;
  }

  @override
  Future<User> fetch(String uuid) async {
    late final User user;
    await collection.isar.txn(() async {
      final data = await collection.get(uuid.fnvHash);
      // todo if data is null throw error
      user = data!;
    });
    return user;
  }

  @override
  Future<void> update(User user) async {
    await collection.isar.writeTxn(() async {
      await collection.put(user);
    });
  }

  @override
  Future<void> delete(String uuid) async {
    await collection.isar.writeTxn(() async {
      await collection.delete(uuid.fnvHash);
      // todo: check: if deleted good else throw
    });
  }
}
