import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:star_book/utils/dates.dart';

class MonthTile extends StatelessWidget {
  const MonthTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> monthName = [
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
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: monthName.length,
      itemBuilder: (context, index) {
        return CalendarCard(monthName: monthName[index], index: index);
      },
    );
  }
}

class CalendarCard extends StatelessWidget {
  final String monthName;
  final int index;

  const CalendarCard({
    Key? key,
    required this.monthName,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MonthsView(month: index),
                ),
              );
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  monthName,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MonthsView extends StatelessWidget {
  final int month;

  const MonthsView({
    Key? key,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Row> dayRows = <Row>[];
    final List datesRow = [];
    final int daysInMonth = Dates.getDaysInMonth(2023, month);
    final int firstWeekdayOfMonth = DateTime(2023, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      datesRow.add(Text(day.toString()));
      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        log('day: $day');
        log('firstWeekdayOfMonth: $firstWeekdayOfMonth');
        log('daysInMonth: $daysInMonth');
        log('datesRow: $datesRow');
        dayRows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.from(datesRow),
          ),
        );
        datesRow.clear();
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dayRows,
      ),
    );
  }
}
