import 'package:star_book/domain/models/mood/mood.dart';

class JournalFormModel {
  static const String titleKey = 'TITLE';
  static const String memoKey = 'MEMO';
  static const String moodKey = 'MOOD';
  final String title;
  final String memo;
  final Mood mood;
  const JournalFormModel({
    required this.title,
    required this.memo,
    required this.mood,
  });

  static final Map<String, dynamic> initialValue =
      JournalFormModel(title: '', memo: '', mood: Mood.initial()).toMap();

  Map<String, dynamic> toMap() => {
        titleKey: title,
        memoKey: memo,
        moodKey: mood,
      };

  factory JournalFormModel.fromJson(Map<String, dynamic> value) {
    return JournalFormModel(
        title: value[titleKey], memo: value[memoKey], mood: value[moodKey]);
  }
}
