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

@freezed
class UserBody with _$UserBody {
  const UserBody._();
  const factory UserBody({
    required final String name,
  }) = _UserBody;

  factory UserBody.fromLSUserBody(U.UserBody from) {
    return UserBody(
      name: from.name,
    );
  }

  factory UserBody.initial() => const UserBody(
        name: '',
      );

  factory UserBody.fromUser(User user) => UserBody(
        name: user.name,
      );

  factory UserBody.fromLSUser(U.User user) => UserBody(
        name: user.name,
      );
}

extension XUserBody on UserBody {
  U.UserBody get toLSUserBody {
    return U.UserBody(
      name: name,
    );
  }
}
