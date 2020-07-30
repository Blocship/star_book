import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Activity> highlightedDays = [];
List storyDetails = List();

class Activity {
  int day;
  int month;
  int year;
  String mood;
  String story;
  String title;
  String category;
  var color;
  double size;
  IconData icon;
  String date;

  Activity(
      {this.size,
      this.title,
      this.category,
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
