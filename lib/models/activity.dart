import 'package:hive/hive.dart';
part 'activity.g.dart';

const String activityBoxName = 'activity';

/// Data Type Activity
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

  bool isFilled() {
    return (this.day != null &&
        this.month != null &&
        this.year != null &&
        this.moodId != null &&
        this.title != null &&
        this.note != null);
  }
}
