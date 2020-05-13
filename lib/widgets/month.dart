import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';
import 'package:star_book/utils/dates.dart';
import 'package:star_book/utils/dayWidget_size.dart';
import 'package:star_book/utils/tag_to_color.dart';
import 'package:star_book/widgets/day.dart';
import 'package:star_book/widgets/month_title.dart';

class MonthWidget extends StatelessWidget {
  MonthWidget(
      {@required this.context,
      @required this.year,
      @required this.month,
      @required this.currentDateColor,
      this.highlightedDays,
      this.onDayPressed});

  final BuildContext context;
  final int year;
  final int month;
  final Color currentDateColor;
  final List<Day> highlightedDays;
  final Function onDayPressed;

  // returns the colour by checking the input date,
  // from the highlighted dates list
  // Color getDayWidgetColor(DateTime date) {
  //   Color color;
  //   if (isCurrentDate(date)) {
  //     color = currentDateColor;
  //   } else if (highlightedDays != null) {
  //     highlightedDays.any((Day day) {
  //       if (date.isAtSameMomentAs(DateTime(year, month, day.day))) {
  //         color = getColor(day.tag);
  //         return true;
  //       } else {
  //         color = null;
  //         return false;
  //       }
  //     });
  //   }
  //   return color;
  // }

  Day getHighlightedDay(DateTime date) {
    Day hDay;
    if (highlightedDays != null) {
      highlightedDays.any((Day day) {
        if (date.isAtSameMomentAs(DateTime(year, month, day.day))) {
          hDay = day;
          return true;
        } else {
          hDay = null;
          return false;
        }
      });
    }
    return hDay;
  }

  // stack the days, and make a grid form of calander.
  Widget buildMonthDays(BuildContext context) {
    final List<Row> dayRows = <Row>[];
    final List<DayWidget> dayRowChildren = <DayWidget>[];
    final int daysInMonth = getDaysInMonth(year, month);
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      Day hDay;
      if (day > 0) {
        hDay = getHighlightedDay(DateTime(year, month, day));
        // getDayWidgetTag
        // getDayWidgetDetail
      }
      dayRowChildren.add(DayWidget(
          day: hDay != null ? hDay : Day(day: day),
          color: hDay != null ? getColor(hDay.tag) : null,
          onDayPressed: onDayPressed));

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

  // stack the month name and the grid of days in column
  Widget buildMonthWidget(BuildContext context) {
    return Container(
      width: 7 * getDayWidgetSize(),
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
