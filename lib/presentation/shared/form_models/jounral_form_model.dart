import 'package:star_book/domain/models/mood/day.dart';
import 'package:star_book/domain/models/mood/mood.dart';

class JournalFormModel {
  static const String titleKey = 'TITLE';
  static const String memoKey = 'MEMO';
  static const String moodKey = 'MOOD';
  static const String createdAtKey = 'CREATED_AT';

  final String title;
  final String memo;
  final Mood? mood;
  final DateTime? createdAt;

  const JournalFormModel({
    required this.title,
    required this.memo,
    required this.mood,
    this.createdAt,
  });

  static Map<String, dynamic> initialValue(Day day) => JournalFormModel(
        title: '',
        memo: '',
        mood: null,
        createdAt: day.toDateTime(),
      ).toMap();

  Map<String, dynamic> toMap() => {
        titleKey: title,
        memoKey: memo,
        moodKey: mood,
        createdAtKey: createdAt,
      };

  factory JournalFormModel.fromJson(Map<String, dynamic> value) {
    return JournalFormModel(
      title: value[titleKey],
      memo: value[memoKey],
      mood: value[moodKey],
      createdAt: value[createdAtKey],
    );
  }
}
