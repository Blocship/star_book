import 'package:isar/isar.dart';
import 'package:star_book/data/utils/utils.dart';

part 'mood.g.dart';

@collection
class Mood {
  final String id;
  final String label;
  final String color;

  const Mood({
    required this.id,
    required this.label,
    required this.color,
  });

  factory Mood.initial() => const Mood(
        id: '',
        label: '',
        color: '',
      );

  Id get key => id.fnvHash;
}
