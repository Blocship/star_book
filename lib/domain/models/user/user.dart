import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_book/data/models/user/user.dart' as U;

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required final String id,
    required final String name,
  }) = _User;

  factory User.fromLSUser(U.User from) {
    return User(
      id: from.id,
      name: from.name,
    );
  }
}

extension XUser on User {
  U.User get toLSUser {
    return U.User(
      id: id,
      name: name,
    );
  }
}
