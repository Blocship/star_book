import 'package:hive/hive.dart';
// Files
import '../utils/string.dart';

part 'activity.g.dart';

/// If you think as relational database then it is the name of [Activity] table.
///
/// constant value `activity`
const String activityBoxName = 'activity';

/// Data Type Activity
///
/// If you think as relational database,
/// table name is [activityBoxName] and fields
/// [id], [day], [month], [year], [moodId], [title] and [note]
/// are table column names
/// and adding [Activtiy] object is like adding new row in database.
@HiveType(typeId: 0)
class Activity extends HiveObject {
  Activity({
    this.id,
    this.day,
    this.month,
    this.year,
    this.moodId,
    this.title,
    this.note,
  });

  /// Deep copy constructor
  Activity.from(Activity activity) {
    this.id = activity.id;
    this.day = activity.day;
    this.month = activity.month;
    this.year = activity.year;
    this.moodId = activity.moodId;
    this.title = activity.title;
    this.note = activity.note;
  }

  @HiveField(0)
  int id;
  @HiveField(1)
  int day;
  @HiveField(2)
  int month;
  @HiveField(3)
  int year;
  @HiveField(4)
  int moodId;
  @HiveField(5)
  String title;
  @HiveField(6)
  String note;

  /// Checks if any of the fields is null or not.
  /// Except [key] and [id]
  bool isFilled() {
    return (this.day != null &&
        this.month != null &&
        this.year != null &&
        this.moodId != null &&
        !isNullOrEmpty(this.title) &&
        !isNullOrEmpty(this.note));
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Activity &&
        this.id == o.id &&
        this.day == o.day &&
        this.month == o.month &&
        this.year == o.year &&
        this.moodId == o.moodId &&
        this.title == o.title &&
        this.note == o.note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        day.hashCode ^
        month.hashCode ^
        year.hashCode ^
        moodId.hashCode ^
        title.hashCode ^
        note.hashCode;
  }

  @override
  String toString() {
    return '{\n id: ${this.id},\n day: ${this.day},\n month: ${this.month},\n year: ${this.year},\n moodId: ${this.moodId},\n title: ${this.title},\n note: ${this.note}, \n}';
  }

  Activity copyWith(
      {int id,
      int day,
      int month,
      int year,
      int moodId,
      String title,
      String note}) {
    return Activity(
        id: id ?? this.id,
        day: day ?? this.day,
        month: month ?? this.month,
        year: year ?? this.year,
        moodId: moodId ?? this.moodId,
        title: title ?? this.title,
        note: note ?? this.note);
  }
}
