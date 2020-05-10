import 'package:flutter/material.dart';

Color getColor(String tag) {
  switch (tag) {
    case "blue":
      return Colors.blue;
      break;
    case "red":
      return Colors.red;
      break;
    case "green":
      return Colors.green;
      break;
    default:
      return null;
      break;
  }
}
