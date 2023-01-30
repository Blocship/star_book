import 'package:flutter/material.dart';
import 'package:star_book/widgets/calendar/day_number.dart';
import 'package:star_book/widgets/calendar/month_title.dart';
import 'package:star_book/utils/screen_sizes.dart';
import 'package:star_book/utils/dates.dart';

class MonthView extends StatelessWidget {
  const MonthView({
    super.key,
    required this.year,
    required this.month,
  });

  final int year;
  final int month;

  Color getDayNumberColor(DateTime date) {
    Color color = Colors.transparent;
    if (Dates.isCurrentDate(date)) {
      color = Colors.pink;
    }
    return color;
  }

  Widget buildMonthDays() {
    final List<Row> dayRows = <Row>[];
    final List<DayNumber> dayRowChildren = <DayNumber>[];

    final int daysInMonth = Dates.getDaysInMonth(year, month);
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      Color color = Colors.transparent;
      if (day > 0) {
        color = getDayNumberColor(DateTime(year, month, day));
      }

      dayRowChildren.add(
        DayNumber(
          day: day,
        ),
      );

      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<DayNumber>.from(dayRowChildren),
          ),
        );
        dayRowChildren.clear();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dayRows,
    );
  }

  Widget buildMonthView(BuildContext context) {
    return Container(
      width: 7.0 * getDayNumberSize(context),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthTitle(
            month: month,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: buildMonthDays(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildMonthView(context),
    );
  }
}
