import 'package:flutter/cupertino.dart';

List<Activity> highlightedDays = List<Activity>();
List storyDetails = List();

class Activity {
  int day;
  int month;
  int year;
  String mood;
  String story;
  var color;
  double size;
  IconData icon;
  String date;

  Activity(
      {this.size,
      this.day,
      this.mood,
      this.story,
      this.color,
      this.icon,
      this.date});

  @override
  bool operator ==(other) {
    return this.day == other.day;
  }

  @override
  int get hashCode => day.hashCode;
}
