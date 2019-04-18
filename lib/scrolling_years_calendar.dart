library scrolling_years_calendar;

import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/year_view.dart';

class ScrollingYearsCalendar extends StatefulWidget {
  final List<String> customMonthNames;
  final Color currentDayColor;
  final Function onMonthClick;
  final BuildContext context;
  final int initialYear;
  final int startYear;
  final int endYear;

  ScrollingYearsCalendar({
    this.currentDayColor = Colors.blue,
    @required this.initialYear,
    @required this.startYear,
    @required this.context,
    @required this.endYear,
    this.customMonthNames,
    this.onMonthClick,
  })  : assert(startYear <= initialYear && initialYear <= endYear),
        assert(customMonthNames == null || customMonthNames.length == 12);

  @override
  _ScrollingYearsCalendarState createState() => _ScrollingYearsCalendarState();
}

class _ScrollingYearsCalendarState extends State<ScrollingYearsCalendar> {
  /// Get a widget with the view of given year
  YearView _getYearView(int year) {
    return YearView(
      customMonthNames: widget.customMonthNames,
      currentDayColor: widget.currentDayColor,
      onMonthClick: widget.onMonthClick,
      context: context,
      year: year,
    );
  }

  @override
  Widget build(BuildContext context) {
    int _itemCount = widget.endYear - widget.startYear + 1;

    // Make sure the right initial offset is calculated so the listview
    // jumps to the initial year
    double _initialOffset =
        (widget.initialYear - widget.startYear) * getYearViewHeight(context);
    ScrollController _scrollController =
        new ScrollController(initialScrollOffset: _initialOffset);

    return ListView.builder(
      controller: _scrollController,
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        int year = index + widget.startYear;
        return _getYearView(year);
      },
    );
  }
}
