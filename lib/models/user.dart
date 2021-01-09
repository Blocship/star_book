import 'package:hive/hive.dart';

class User extends HiveObject {
  String name;

  // constructor
  User(this.name);
}