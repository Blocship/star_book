import 'package:isar/isar.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/models/user/user.dart';

Future<void> registerSchema() async {
  await Isar.open([JournalSchema, MoodSchema, UserSchema]);
}
