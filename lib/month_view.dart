import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/dates.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/month_title.dart';
import 'package:scrolling_years_calendar/day_number.dart';

class MonthView extends StatelessWidget {
  final BuildContext context;
  final int year;
  final int month;
  final double padding;
  final Color todayColor;
  final List<String> customMonthNames;
  final Function onMonthTap;

  MonthView({
    @required this.context,
    @required this.year,
    @required this.month,
    @required this.padding,
    this.todayColor,
    this.customMonthNames,
    this.onMonthTap,
  });

  Widget buildMonthDays(BuildContext context) {
    List<Widget> dayRows = [];
    List<Widget> dayRowChildren = [];

    int daysInMonth = getDaysInMonth(this.year, this.month);
    int firstWeekdayOfMonth = DateTime(this.year, this.month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      bool isToday = dateIsToday(DateTime(this.year, this.month, day));
      dayRowChildren.add(
        DayNumber(
          day: day,
          isToday: isToday,
          todayColor: this.todayColor,
        ),
      );

      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List.from(dayRowChildren),
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
      margin: EdgeInsets.all(this.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthTitle(
            month: this.month,
            customMonthNames: this.customMonthNames,
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: buildMonthDays(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.onMonthTap == null
        ? Container(
            child: this.buildMonthView(context),
          )
        : FlatButton(
            onPressed: () => this.onMonthTap(this.year, this.month),
            padding: EdgeInsets.all(0.0),
            child: this.buildMonthView(context),
          );
  }
}
