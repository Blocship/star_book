import 'package:flutter/material.dart';

class Day {
  int day;
  String tag;
  String detail;

  Day({@required this.day, this.tag, this.detail});

  @override
  bool operator ==(other) {
    return this.day == other.day;
  }

  @override
  int get hashCode => day.hashCode;
}
