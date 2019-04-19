import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/month_view.dart';
import 'package:scrolling_years_calendar/year_title.dart';

class YearView extends StatelessWidget {
  final BuildContext context;
  final int year;
  final Color todayColor;
  final List<String> customMonthNames;
  final Function onMonthTap;
  final double horizontalMargin = 16.0;
  final double monthViewPadding = 8.0;

  YearView({
    @required this.context,
    @required this.year,
    this.todayColor,
    this.customMonthNames,
    this.onMonthTap,
  });

  Widget buildYearMonths(BuildContext context) {
    List<Widget> monthRows = [];
    List<Widget> monthRowChildren = [];

    for (int month = 1; month <= DateTime.monthsPerYear; month++) {
      monthRowChildren.add(
        MonthView(
          context: context,
          year: this.year,
          month: month,
          padding: this.monthViewPadding,
          todayColor: this.todayColor,
          customMonthNames: this.customMonthNames,
          onMonthTap: this.onMonthTap,
        ),
      );

      if (month % 3 == 0) {
        monthRows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.from(monthRowChildren),
          ),
        );
        monthRowChildren.clear();
      }
    }

    return Column(
      children: List.from(monthRows),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: this.horizontalMargin,
              vertical: 0.0,
            ),
            child: YearTitle(this.year),
          ),
          Container(
            margin: EdgeInsets.only(
              left: this.horizontalMargin,
              right: this.horizontalMargin,
              top: 8.0,
            ),
            child: Divider(
              color: Colors.black26,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: this.horizontalMargin - this.monthViewPadding,
              vertical: 0.0,
            ),
            child: buildYearMonths(context),
          ),
        ],
      ),
    );
  }
}
