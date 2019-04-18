import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/dates.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/month_title.dart';

class MonthView extends StatelessWidget {
  final BuildContext context;
  final int year;
  final int month;
  final Function onMonthClick;
  final Color currentDayColor;
  final List<String> customMonthNames;
  static const double monthViewPadding = 5.0;

  MonthView({
    @required this.context,
    @required this.year,
    @required this.month,
    @required this.currentDayColor,
    this.onMonthClick,
    this.customMonthNames,
  });

  Widget getMonthDays() {
    List<Widget> items = [];
    List<Widget> newRow = [];

    int numberOfDaysInMonth = getNumberOfDaysInMonth(year, month);
    int weekDayOfFirstOfMonth = DateTime(year, month, 1).weekday;
    double dayNumberSize = getDayNumberSize(context);

    // Add the widgets for the month title and all
    for (int day = 1;
        day < (numberOfDaysInMonth + weekDayOfFirstOfMonth);
        day++) {
      bool isTheCurrentDate =
          onTheSameDate(DateTime(year, month, day), DateTime.now());
      if (day < weekDayOfFirstOfMonth) {
        newRow.add(
          Container(
            width: dayNumberSize,
            height: dayNumberSize,
          ),
        );
      } else {
        newRow.add(
          Container(
            width: dayNumberSize,
            height: dayNumberSize,
            padding: isTheCurrentDate ? EdgeInsets.all(1.0) : null,
            decoration: isTheCurrentDate
                ? BoxDecoration(
                    color: currentDayColor,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  )
                : BoxDecoration(),
            child: Text(
              (day - weekDayOfFirstOfMonth + 1).toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isTheCurrentDate ? Colors.white : Colors.black87,
                fontSize:
                    (screenSize(context) == ScreenSizes.small) ? 8.0 : 10.0,
              ),
            ),
          ),
        );
      }

      // Add a new row of days for each week in the month
      if ((day % 7 == 0) ||
          (day == (numberOfDaysInMonth + weekDayOfFirstOfMonth - 1))) {
        items.add(
          Row(
            children: List.from(newRow),
          ),
        );
        newRow.clear();
      }
    }

    // Wrap every month in a FlatButton widget to be able to click on them
    return Container(
      width: (MediaQuery.of(context).size.width) * 0.3 - 10.0,
      margin:
          EdgeInsets.all((MediaQuery.of(context).size.width * 0.1 - 20.0) / 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () =>
          onMonthClick != null ? onMonthClick(year, month) : () => {},
      padding: EdgeInsets.all(monthViewPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthTitle(month: month, customMonthNames: customMonthNames),
          getMonthDays(),
        ],
      ),
    );
  }
}
