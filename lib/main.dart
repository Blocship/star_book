import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';
import 'package:star_book/widgets/day.dart';
import 'package:star_book/widgets/month.dart';
// import 'package:star_book/widgets/month.dart';

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
  List<Day> highlightedDays = [
    new Day(day: 1, color: Colors.blue),
    new Day(day: 3, color: Colors.green),
    new Day(day: 5, color: Colors.red),
  ];

  onDayPressed(Day day) {
    highlightedDays.removeWhere((d) => d.day == day.day);
    setState(() {
      highlightedDays.add(Day(day: day.day, color: Colors.brown));
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
          highlightedDates: highlightedDays,
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
