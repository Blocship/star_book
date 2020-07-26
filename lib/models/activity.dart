import 'package:flutter/cupertino.dart';

List<Activity> highlightedDays = List<Activity>();

class Activity {
  int day;
  int month;
  int year;
  String mood;
  String story;
  var color;
  double size;
  IconData icon;

  Activity({this.size, this.day, this.mood, this.story, this.color, this.icon});

  @override
  bool operator ==(other) {
    return this.day == other.day;
  }

  @override
  int get hashCode => day.hashCode;
}
