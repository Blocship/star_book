import 'package:hive/hive.dart';
// Files
import '../utils/color.dart';

part 'mood.g.dart';

const String moodBoxName = 'mood';

/// Data Type Mood
@HiveType(typeId: 1)
class Mood {
  Mood({
    this.id,
    this.label,
    this.colorCode,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  String label;
  @HiveField(2)
  int colorCode;
}

/// Mock list of Moods
List<Mood> mMoodList = new List<Mood>()
  ..add(Mood(id: 0, label: "Happy", colorCode: EColor.systemBlue.index))
  ..add(Mood(id: 1, label: "Sad", colorCode: EColor.systemIndigo.index))
  ..add(Mood(id: 2, label: "Productive", colorCode: EColor.systemGreen.index))
  ..add(Mood(id: 3, label: "Sick", colorCode: EColor.systemYellow.index))
  ..add(Mood(id: 4, label: "Normal", colorCode: EColor.systemOrange.index))
  ..add(Mood(id: 5, label: "Angry", colorCode: EColor.systemRed.index));
