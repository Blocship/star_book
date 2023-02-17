import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/models/mood/day.dart';
import 'package:star_book/domain/models/mood/mood.dart';

class MoodInfo {
  late Map<Day, List<Mood>> info;

  MoodInfo.fromJourunal({
    required List<Journal> journals,
  }) {
    info = {};
    for (final journal in journals) {
      final day = Day.fromDateTime(journal.createdAt);
      if (info.containsKey(day)) {
        info[day]!.add(journal.mood);
      } else {
        info[day] = [journal.mood];
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
