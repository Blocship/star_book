import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

// Files
import '../utils/color.dart';
import '../utils/constant.dart';

part 'mood.freezed.dart';
part 'mood.g.dart';

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
@freezed
abstract class Mood with _$Mood {
  @HiveType(typeId: kMoodTypeId, adapterName: 'MoodAdapter')
  const factory Mood({
    @HiveField(0) required int id,
    @HiveField(1) required String label,
    @HiveField(2) required int colorCode,
  }) = _Mood;
}

/// Mock list of Moods
List<Mood> mMoodList = []
  ..add(Mood(id: 0, label: 'Happy', colorCode: MoodColor.systemBlue.index))
  ..add(Mood(id: 1, label: 'Sad', colorCode: MoodColor.systemIndigo.index))
  ..add(
      Mood(id: 2, label: 'Productive', colorCode: MoodColor.systemGreen.index))
  ..add(Mood(id: 3, label: 'Sick', colorCode: MoodColor.systemYellow.index))
  ..add(Mood(id: 4, label: 'Normal', colorCode: MoodColor.systemOrange.index))
  ..add(Mood(id: 5, label: 'Angry', colorCode: MoodColor.systemRed.index));
