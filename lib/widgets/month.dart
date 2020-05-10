import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';
import 'package:star_book/utils/dates.dart';
import 'package:star_book/utils/screen_sizes.dart';
import 'package:star_book/widgets/day.dart';
import 'package:star_book/widgets/month_title.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget(
      {@required this.context,
      @required this.year,
      @required this.month,
      @required this.currentDateColor,
      this.highlightedDates,
      this.onDayPressed});

  final BuildContext context;
  final int year;
  final int month;
  final Color currentDateColor;
  final List<Day> highlightedDates;
  final Function onDayPressed;

  Color getDayWidgetColor(DateTime date) {
    Color color;
    if (isCurrentDate(date)) {
      color = currentDateColor;
    } else if (highlightedDates != null) {
      highlightedDates.any((Day highlightedDate) {
        if (date.isAtSameMomentAs(DateTime(year, month, highlightedDate.day))) {
          color = highlightedDate.color;
          return true;
        } else {
          color = null;
          return false;
        }
      });
    }
    return color;
  }

  Widget buildMonthDays(BuildContext context) {
    final List<Row> dayRows = <Row>[];
    final List<DayWidget> dayRowChildren = <DayWidget>[];

    final int daysInMonth = getDaysInMonth(year, month);
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      Color color;
      if (day > 0) {
        color = getDayWidgetColor(DateTime(year, month, day));
      }

      dayRowChildren.add(
        DayWidget(
          day: Day(day: day, color: color),
          onDayPressed: onDayPressed,
        ),
      );

      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<DayWidget>.from(dayRowChildren),
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

  Widget buildMonthWidget(BuildContext context) {
    return Container(
      width: 7 * getDayWidgetSize(context),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthTitle(
            month: month,
            monthNames: null,
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
    return Container(
      child: buildMonthWidget(context),
    );
  }
}
