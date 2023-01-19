import 'package:isar/isar.dart';
import 'package:star_book/data/utils/utils.dart';

part 'journal.g.dart';

@collection
class Journal {
  final String id;
  @Index()
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> mood;
  final String title;
  final String memo;

  const Journal({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.mood,
    required this.title,
    required this.memo,
  });

  factory Journal.initial() => Journal(
        id: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        mood: ['happy'],
        title: '',
        memo: '',
      );

  Id get key => id.fnvHash;
}
