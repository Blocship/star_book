import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';
import 'package:star_book/widgets/month.dart';

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
  // the list of highlighted day,
  // this will be coming from and stored in
  // database later.
  List<Day> highlightedDays = [
    new Day(day: 1, tag: "green", detail: "I had a very happy day"),
    new Day(day: 3, tag: "blue", detail: "My day was normal"),
    new Day(day: 5, tag: "red", detail: "I was very angry today"),
  ];

  // onpressed event, calls on pressing on day.
  // updates the highlighted days list
  onDayPressed(Day day) {
    highlightedDays.removeWhere((d) => d.day == day.day);
    setState(() {
      highlightedDays.add(Day(day: day.day, tag: day.tag, detail: day.detail));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StarBook'),
      ),
      body: Center(
        child: MonthWidget(
          context: context,
          year: 2020,
          month: 5,
          currentDateColor: Colors.blueGrey,
          highlightedDays: highlightedDays,
          onDayPressed: onDayPressed,
        ),
      ),
    );
  }
}

// Column(
//               children: highlightedDays.map((Day d) {
//         return DayWidget(
//           day: d,
//           onDayPressed: onDayPressed,
//         );
//       }).toList())
