import 'package:flutter/material.dart';
import 'package:star_book/presentation/utils/calendar.dart';

class DaysOfMonth extends StatelessWidget {
  final int year;
  final int month;

  const DaysOfMonth({
    Key? key,
    required this.year,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<Row> dayRows = <Row>[];
    final List<Date> dayRowChildren = <Date>[];

    /// It will give total days in the months
    final int daysInMonth = CalendarUtils.getDaysInMonth(year, month);

    /// It will let you know the first day of the week of the given year and month
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      dayRowChildren.add(Date(day: day));

      /// Move to new row
      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<Date>.from(dayRowChildren),
          ),
        );
        dayRowChildren.clear();
      }
    }

    /// This will display the week days and dates of the month
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Year',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 40),
            SizedBox(
              width: screenWidth * 0.9,
              child: Text(
                CalendarUtils.getFullMonthName(month),
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                WeekDaysView(),
              ],
            ),
            Column(
              children: dayRows,
            ),
          ],
        ),
      ),
    );
  }
}

class WeekDaysView extends StatelessWidget {
  const WeekDaysView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return SizedBox(
      width: screenWidth * 0.933,
      height: screenHeight * 0.04,
      child: ListView.builder(
        itemCount: weekDays.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 48,
            height: 50,
            child: Text(
              weekDays[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Date extends StatelessWidget {
  const Date({
    super.key,
    required this.day,
  });

  final int day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        day < 1 ? '' : day.toString(),
        style: const TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
