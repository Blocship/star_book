import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/domain/models/mood/day.dart';
import 'package:star_book/domain/models/mood/mood.dart';

class MoodInfo {
  late Map<Day, List<Mood>> info;

  MoodInfo.fromJournal({
    required List<Journal> journals,
  }) {
    info = {};
    for (final journal in journals) {
      final day = Day.fromDateTime(journal.createdAt);
      if (info.containsKey(day)) {
        info[day]!.add(Mood.fromLSMood(journal.mood));
      } else {
        info[day] = [Mood.fromLSMood(journal.mood)];
      }
    }
  }

  List<Mood> getMoodsForDay({required Day day}) {
    return info[day] ?? [];
  }

  List<Mood> getMoodsFor({required DateTime day}) {
    return getMoodsForDay(day: Day.fromDateTime(day));
  }
}
