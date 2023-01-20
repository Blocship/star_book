import 'package:isar/isar.dart';
import 'package:star_book/data/utils/utils.dart';

part 'mood.g.dart';

@collection
class Mood {
  final String id;
  final String label;
  final int color;

  const Mood({
    required this.id,
    required this.label,
    required int color,
  }) : color = color & 0xFFFFFFFF;

  factory Mood.initial() => const Mood(
        id: '',
        label: '',
        color: 0xFFFFFFFF,
      );

  Id get key => id.fnvHash;
}
