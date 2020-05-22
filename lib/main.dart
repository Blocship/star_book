import 'package:flutter/material.dart';
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
