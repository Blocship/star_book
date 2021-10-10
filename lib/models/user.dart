import 'package:hive/hive.dart';

// Files
import '../utils/constant.dart';

part 'user.g.dart';

/// User Details Table
///
/// If you think as relational database,
/// [name]
/// are table column names
@HiveType(typeId: kUserTypeId)
class User extends HiveObject {
  @HiveField(0)
  final String name;

  User({
    required this.name,
  });

  @override
  int get hashCode {
    return name.hashCode;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && this.name == o.name;
  }

  User copyWith({String? name}) {
    return User(
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return '{\n name: $name, \n}';
  }
}
