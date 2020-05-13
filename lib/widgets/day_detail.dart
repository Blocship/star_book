import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';

class DayDetailPage extends StatelessWidget {
  final Day data;
  DayDetailPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("day ${data.day} Tag: ${data.tag}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${data.detail}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'blue');
                  // Pop here with "Yep"...
                },
                child: Text('blue'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'green');
                  // Pop here with "Yep"...
                },
                child: Text('green'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'red');
                  // Pop here with "Nope"
                },
                child: Text('red'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
