import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';

class DayDetailPage extends StatelessWidget {
  final Day data;
  DayDetailPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped
            Navigator.pop(context, "Hey");
          },
          child: Text('Go back! ${data.day}'),
        ),
      ),
    );
  }
}
