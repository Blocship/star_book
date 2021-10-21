import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

// Files
import '../utils/constant.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User Details Table
///
/// If you think as relational database,
/// [name]
/// are table column names
@freezed
abstract class User with _$User {
  @HiveType(typeId: kUserTypeId, adapterName: 'UserAdapter')
  const factory User({
    @HiveField(0) required String name,
  }) = _User;

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
