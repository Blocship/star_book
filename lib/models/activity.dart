import 'package:flutter/material.dart';

class Activity {
  int day;
  String tag;
  String detail;

  Activity({@required this.day, this.tag, this.detail});

  @override
  bool operator ==(other) {
    return this.day == other.day;
  }

  @override
  int get hashCode => day.hashCode;
}
