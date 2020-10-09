// Files
import '../models/mood.dart';

class Activity {
  Activity({
    this.id,
    this.day,
    this.month,
    this.year,
    this.mood,
    this.title,
    this.note,
  });
  int id;
  int day;
  int month;
  int year;
  Mood mood;
  String title;
  String note;
}

List<Activity> mActivityList = new List<Activity>()
  ..add(
    Activity(
        id: 0,
        day: 1,
        month: 10,
        year: 2020,
        mood: mMoodList[0],
        title: "First Day of Oct",
        note:
        "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )..add(
    Activity(
        id: 1,
        day: 2,
        month: 10,
        year: 2020,
        mood: mMoodList[0],
        title: "Second Day of Oct",
        note:
        "Aenean diam mi, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )..add(
    Activity(
        id: 2,
        day: 3,
        month: 10,
        year: 2020,
        mood: mMoodList[1],
        title: "Third Day of Oct",
        note:
        "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )..add(
    Activity(
        id: 3,
        day: 4,
        month: 10,
        year: 2020,
        mood: mMoodList[1],
        title: "Forth Day of Oct",
        note:
        "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )..add(
    Activity(
        id: 4,
        day: 7,
        month: 10,
        year: 2020,
        mood: mMoodList[2],
        title: "Seventh Day of Oct",
        note:
        "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  )..add(
    Activity(
        id: 5,
        day: 8,
        month: 10,
        year: 2020,
        mood: mMoodList[3],
        title: "Eighth Day of Oct",
        note:
        "Aenean diam mi, euismod sed euismod at, condimentum in enim. Quisque in suscipit nunc. Mauris faucibus neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ornare turpis sed ex efficitur suscipit ac placerat lorem."),
  )..add(
    Activity(
        id: 6,
        day: 9,
        month: 10,
        year: 2020,
        mood: mMoodList[4],
        title: "Ninth Day of Oct",
        note:
        "Aenean diam mi, euismod sed euismod at, in enim. Quisque in suscipit nunc. Mauris neque lorem, sit amet placerat risus viverra pulvinar. In in libero mi. Donec ex efficitur suscipit ac placerat lorem. Nullam magna massa, auctor in dictum ac, elementum nec diam. Maecenas in suscipit tellus."),
  );
