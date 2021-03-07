import 'package:hive/hive.dart';

// Files
import '../utils/color.dart';
import '../utils/constant.dart';

part '../models_hive_generated/mood.g.dart';

/// If you think as relational database then it is the name of [Mood] table.
///
/// constant value `mood`
const String moodBoxName = 'mood';

/// Data Type Mood
///
/// If you think as relational database
/// table name is [moodBoxName] and fields
/// [id], [label] and [colorCode]
/// are table column names
/// and adding [Activtiy] object is like adding new row in database.
@HiveType(typeId: kMoodTypeId)
class Mood extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String label;
  @HiveField(2)
  int colorCode;

  Mood({
    this.id,
    this.label,
    this.colorCode,
  });

  @override
  int get hashCode {
    return id.hashCode ^ label.hashCode ^ colorCode.hashCode;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Mood &&
        this.id == o.id &&
        this.label == o.label &&
        this.colorCode == o.colorCode;
  }

  Mood copyWith({int id, String label, int colorCode}) {
    return Mood(
        id: id ?? this.id,
        label: label ?? this.label,
        colorCode: colorCode ?? this.colorCode);
  }

  @override
  String toString() {
    return '{\n id: $id, \n label: $label, \n colorCode: $colorCode, \n}';
  }
}

/// Mock list of Moods
List<Mood> mMoodList = new List<Mood>()
  ..add(Mood(id: 0, label: "Happy", colorCode: MoodColor.systemBlue.index))
  ..add(Mood(id: 1, label: "Sad", colorCode: MoodColor.systemIndigo.index))
  ..add(
      Mood(id: 2, label: "Productive", colorCode: MoodColor.systemGreen.index))
  ..add(Mood(id: 3, label: "Sick", colorCode: MoodColor.systemYellow.index))
  ..add(Mood(id: 4, label: "Normal", colorCode: MoodColor.systemOrange.index))
  ..add(Mood(id: 5, label: "Angry", colorCode: MoodColor.systemRed.index));
