import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:star_book/models/app.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.user)
class User with _$User {
  const User._();
  const factory User({
    @HiveField(0) @JsonKey(name: '_id') required final String id,
    @HiveField(1) required final String name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String get key => id;
}
