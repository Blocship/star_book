import 'package:hive/hive.dart';

part 'activity.g.dart';

const String activityBoxName = 'activity';

/// Data Type Activity
@HiveType(typeId: 0)
class Activity {
  Activity({
    this.id,
    this.day,
    this.month,
    this.year,
    this.moodId,
    this.title,
    this.note,
  });
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

/// Mock list of Activities
List<Activity> mActivityList = new List<Activity>()
  ..add(
    Activity(
        id: 0,
        day: 1,
        month: 10,
        year: 2020,
        moodId: 0,
        title: "First Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )
  ..add(
    Activity(
        id: 1,
        day: 2,
        month: 10,
        year: 2020,
        moodId: 0,
        title: "Second Day of Oct",
        note:
            "Aenean diam mi, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )
  ..add(
    Activity(
        id: 2,
        day: 3,
        month: 10,
        year: 2020,
        moodId: 1,
        title: "Third Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )
  ..add(
    Activity(
        id: 3,
        day: 4,
        month: 10,
        year: 2020,
        moodId: 1,
        title: "Forth Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )
  ..add(
    Activity(
        id: 4,
        day: 7,
        month: 10,
        year: 2020,
        moodId: 2,
        title: "Seventh Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )
  ..add(
    Activity(
        id: 5,
        day: 8,
        month: 10,
        year: 2020,
        moodId: 3,
        title: "Eighth Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem."),
  )
  ..add(
    Activity(
        id: 6,
        day: 9,
        month: 10,
        year: 2020,
        moodId: 4,
        title: "Ninth Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, in enim. Quisque in suscipit nunc. Mauris neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )
  ..add(
    Activity(
        id: 4,
        day: 7,
        month: 9,
        year: 2020,
        moodId: 2,
        title: "Seventh Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )
  ..add(
    Activity(
        id: 5,
        day: 8,
        month: 9,
        year: 2020,
        moodId: 3,
        title: "Eighth Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem."),
  )
  ..add(
    Activity(
        id: 6,
        day: 9,
        month: 9,
        year: 2020,
        moodId: 4,
        title: "Ninth Day of Oct",
        note:
            "Aenean diam mi, euismod sed euismod at, in enim. Quisque in suscipit nunc. Mauris neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  );
