import 'package:dataclass/dataclass.dart';
import 'package:hive/hive.dart';

class User extends HiveObject {
  String name;

  // constructor
  User(this.name);

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! User) return false;

    return true && this.name == other.name;
  }

  @override
  int get hashCode {
    return mapPropsToHashCode([name]);
  }

  @override
  String toString() {
    return '{\n name: $name}';
  }

  User copyWith({String name}) {
    return User(name ?? this.name);
  }
}
