import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';
import 'package:star_book/month_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarBook',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DateTime> getHighlightedDates() {
    return [DateTime(2020, 5, 1), DateTime(2020, 5, 3)];
    // List<DateTime>.generate(
    //   10,
    //   (int index) => DateTime.now().add(Duration(days: 1 * (index + 1))),
    // );
  }

  List<Day> highlighted_days = [
    new Day(date: DateTime(2020, 5, 1), color: Colors.blue),
    new Day(date: DateTime(2020, 5, 3), color: Colors.green),
    new Day(date: DateTime(2020, 5, 5), color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StarBook'),
      ),
      body: Center(
          child: MonthView(
        context: context,
        year: 2020,
        month: 5,
        padding: 0,
        currentDateColor: Colors.brown,
        highlightedDates: highlighted_days,
        highlightedDateColor: Colors.blue,
      )),
    );
  }
}
