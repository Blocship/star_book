import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/scrolling_years_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrolling Years Calendar',
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
    return List<DateTime>.generate(
      10,
      (int index) => DateTime.now().add(Duration(days: 10 * (index + 1))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Scrolling Calendar'),
      ),
      body: Center(
        child: ScrollingYearsCalendar(
          // Required properties
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 5 * 365)),
          lastDate: DateTime.now(),
          currentDateColor: Colors.blue,

          // Optional properties
          highlightedDates: getHighlightedDates(),
          highlightedDateColor: Colors.deepOrange,
          monthNames: const <String>[
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec',
          ],
          onMonthTap: (int year, int month) => print('Tapped $month/$year'),
        ),
      ),
    );
  }
}
