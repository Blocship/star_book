import 'package:flutter/material.dart';
import 'package:star_book/controllers/activity.dart';


class BaseController{
  Future<void> initialize();
  Future<void> dispose();

  Future<void> reset() async{
    await dispose();
    await initialize();
  }


  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}