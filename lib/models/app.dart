import 'package:hive/hive.dart';
import 'package:star_book/models/mood/mood.dart';
import 'package:star_book/models/user/user.dart';
import 'journal/journal.dart';

class HiveTypeIds {
  static const int journal = 0;
  static const int mood = 1;
  static const int user = 2;
}

void registerHiveAdapter() {
  Hive.registerAdapter(JournalAdapter());
  Hive.registerAdapter(MoodAdapter());
  Hive.registerAdapter(UserAdapter());
}
