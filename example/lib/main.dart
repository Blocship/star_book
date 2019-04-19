import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/scrolling_years_calendar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Scrolling Years Calendar',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Scrolling Calendar"),
      ),
      body: new Center(
        child: ScrollingYearsCalendar(
          // Required attributes
          context: context,
          initialYear: DateTime.now().year,
          startYear: DateTime.now().year - 5,
          endYear: DateTime.now().year,

          // Optional attributes
          currentDayColor: Colors.blue,
          customMonthNames: [
            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "May",
            "Jun",
            "Jul",
            "Aug",
            "Sep",
            "Oct",
            "Nov",
            "Dec",
          ],
          onMonthClick: (int year, int month) => print("Clicked $month/$year"),
        ),
      ),
    );
  }
}
