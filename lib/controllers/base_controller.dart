import 'package:flutter/material.dart';
import 'package:star_book/controllers/activity.dart';


abstract class BaseController {
  Future<void> initialize();

  Future<void> dispose();

  Future<void> reset() async {
    await dispose();
    await initialize();
  }
}

