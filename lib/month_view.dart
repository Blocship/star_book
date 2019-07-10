import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/dates.dart' as dates;
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/month_title.dart';
import 'package:scrolling_years_calendar/day_number.dart';

class MonthView extends StatelessWidget {
  const MonthView({
    @required this.context,
    @required this.year,
    @required this.month,
    @required this.padding,
    this.currentDateColor,
    this.monthNames,
    this.onMonthTap,
  });

  final BuildContext context;
  final int year;
  final int month;
  final double padding;
  final Color currentDateColor;
  final List<String> monthNames;
  final Function onMonthTap;

  Widget buildMonthDays(BuildContext context) {
    final List<Row> dayRows = <Row>[];
    final List<DayNumber> dayRowChildren = <DayNumber>[];

    final int daysInMonth = dates.getDaysInMonth(year, month);
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      final bool isCurrentDate =
          dates.isCurrentDate(DateTime(year, month, day));
      dayRowChildren.add(
        DayNumber(
          day: day,
          isCurrentDate: isCurrentDate,
          currentDateColor: currentDateColor,
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
      width: 7 * getDayNumberSize(context),
      margin: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthTitle(
            month: month,
            monthNames: monthNames,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: buildMonthDays(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return onMonthTap == null
        ? Container(
            child: buildMonthView(context),
          )
        : FlatButton(
            onPressed: () => this.onMonthTap(year, month),
            padding: const EdgeInsets.all(0.0),
            child: buildMonthView(context),
          );
  }
}
