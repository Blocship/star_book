import 'package:hive/hive.dart';

/// If you think as relational database then it is the name of [User] table.

/// User Details Table
///
/// If you think as relational database,
/// [name]
/// are table column names
class User extends HiveObject {
  String name;

  // constructor
  User(this.name);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && this.name == o.name;
  }

  @override
  int get hashCode {
    return name.hashCode;
  }

  @override
  String toString() {
    return '{\n name: $name}, \n';
  }

  User copyWith({String name}) {
    return User(name ?? this.name);
  }
}
