import 'package:flutter/material.dart';

class Activity {
  int day;
  int month;
  int year;
  String mood;
  String detail;

  Activity({@required this.day, this.mood, this.detail});

  @override
  bool operator ==(other) {
    return this.day == other.day;
  }

  @override
  int get hashCode => day.hashCode;
}
