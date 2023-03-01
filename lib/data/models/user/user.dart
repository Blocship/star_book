import 'package:isar/isar.dart';
import 'package:star_book/data/utils/utils.dart';

part 'user.g.dart';

@collection
class User {
  final String id;
  final String name;

  const User({
    required this.id,
    required this.name,
  });

  Id get key => id.fnvHash;
}

class UserBody {
  final String name;

  const UserBody({
    required this.name,
  });
}
