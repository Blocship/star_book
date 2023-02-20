import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/models/mood/mood.dart';

typedef Frequency = int;

class MoodFrequency {
  late Map<Mood, Frequency> info;

  MoodFrequency.fromJournal(List<Journal> journals) {
    info = {};
    for (final journal in journals) {
      final mood = journal.mood;
      if (info.containsKey(mood)) {
        info[mood] = info[mood]! + 1;
      } else {
        info[mood] = 1;
      }
    }
  }
}
