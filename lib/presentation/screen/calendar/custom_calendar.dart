import 'package:flutter/material.dart';
import 'package:star_book/presentation/screen/calendar/calendar_view.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    /// This will give us previous year like 2018
    final int pastYear =
        DateTime.now().subtract(const Duration(days: 5 * 365)).year;

    /// This will give us total number of year to display
    /// according to [pastYear]
    final int itemCount = DateTime.now().year - pastYear + 1;

    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          /// To display widget in reverse order
          final int year = DateTime.now().year - index;
          return CalendarView(year: year);
        },
      ),
    );
  }
}
