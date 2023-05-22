import 'package:star_book/data/data_source/local_data_source/base_api.dart';

abstract class IAuthApi extends BaseApi {
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
}

class LSAuthApi implements IAuthApi {
  @override
  Future<bool> isSignedIn() async {
    return false;
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    return;
  }

  @override
  Future<void> signOut() async {
    return;
  }

  @override
  Future<String> getUser() async {
    return '';
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    return;
  }
}
