import 'package:isar/isar.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/utils/utils.dart';

part 'journal.g.dart';

@collection
class Journal {
  final String id;
  @Index()
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String memo;

  Journal({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.memo,
  });

  factory Journal.initial() => Journal(
        id: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        title: '',
        memo: '',
      );

  @ignore
  Mood get mood {
    return moodRelation.value!;
  }

  set mood(Mood value) {
    moodRelation.value = value;
  }

  Id get key => id.fnvHash;
  final moodRelation = IsarLink<Mood>();
}

class JournalBody {
  final Mood mood;
  final String title;
  final String memo;
  final DateTime? createdAt;

  JournalBody({
    required this.mood,
    required this.title,
    required this.memo,
    required this.createdAt,
  });
}
