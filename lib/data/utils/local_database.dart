import 'package:isar/isar.dart';
import 'package:star_book/data/models/user/user.dart';

import '../models/journal/journal.dart';
import '../models/mood/mood.dart';

abstract class LocalDatabase {
  static Future<void> initialise({required directory}) async {
    await Isar.open(
      [
        JournalSchema,
        MoodSchema,
        UserSchema,
      ],
      directory: directory,
    );
  }
}
