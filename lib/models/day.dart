import 'package:flutter/material.dart';

class Day {
  int day;
  Color color;
  String tag;

  Day({this.day, this.color});

  @override
  bool operator ==(other) {
    return this.day == other.day;
  }
}
