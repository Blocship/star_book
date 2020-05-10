import 'package:flutter/material.dart';

class Day {
  int day;
  Color color;
  String tag;

  Day({@required this.day, @required this.tag, this.color});

  @override
  bool operator ==(other) {
    return this.day == other.day;
  }

  @override
  int get hashCode => day.hashCode;
}
