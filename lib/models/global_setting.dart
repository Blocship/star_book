import 'package:hive/hive.dart';

// Files
import '../utils/constant.dart';

part '../models_hive_generated/brightness.g.dart';
part '../models_hive_generated/user.g.dart';

const String userBoxName = 'user';
const String reminderBoxName = 'brightness';
const String brightnessBoxName = 'brightness';
const String globalSettingBoxName = 'globalSetting';

/// Enumeration - To keep check on Brightness Level of Application
@HiveType(typeId: brightnessTypeId)
enum BrightnessOption {
  @HiveField(0)
  light,
  @HiveField(1)
  dark,
  @HiveField(2)
  auto,
}

/// User Details Table
///
/// If you think as relational database,
/// [name]
/// are table column names
@HiveType(typeId: userTypeId)
class User extends HiveObject {
  User({this.name});

  @HiveField(0)
  String name;

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
    return '{\n name: $name, \n}';
  }

  User copyWith({String name}) {
    return User(name: name ?? this.name);
  }
}
