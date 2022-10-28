import 'package:star_book/api/base_api.dart';
import 'package:star_book/models/user/user.dart';

abstract class IJournalApi extends BaseApi {
  static const String collectionName = 'journalCollection';

  Stream<List<User>> getJournalStream();

  Future<void> delete(String journalId);
  Future post(User user);
}