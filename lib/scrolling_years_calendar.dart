library scrolling_years_calendar;

import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/year_view.dart';

class ScrollingYearsCalendar extends StatefulWidget {
  ScrollingYearsCalendar({
    @required this.context,
    @required this.initialYear,
    @required this.startYear,
    @required this.endYear,
    this.todayColor,
    this.monthNames,
    this.onMonthTap,
  })  : assert(startYear <= initialYear && initialYear <= endYear),
        assert(
            monthNames == null || monthNames.length == DateTime.monthsPerYear);

  final BuildContext context;
  final int initialYear;
  final int startYear;
  final int endYear;
  final Color todayColor;
  final List<String> monthNames;
  final Function onMonthTap;

  @override
  _ScrollingYearsCalendarState createState() => _ScrollingYearsCalendarState();
}

class _ScrollingYearsCalendarState extends State<ScrollingYearsCalendar> {
  /// Gets a widget with the view of the given year.
  YearView _getYearView(int year) {
    return YearView(
      context: context,
      year: year,
      todayColor: widget.todayColor,
      monthNames: widget.monthNames,
      onMonthTap: widget.onMonthTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final int _itemCount = widget.endYear - widget.startYear + 1;

    // Makes sure the right initial offset is calculated so the listview
    // jumps to the initial year.
    final double _initialOffset =
        (widget.initialYear - widget.startYear) * getYearViewHeight(context);
    final ScrollController _scrollController =
        ScrollController(initialScrollOffset: _initialOffset);

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16.0),
      controller: _scrollController,
      itemCount: _itemCount,
      itemBuilder: (BuildContext context, int index) {
        final int year = index + widget.startYear;
        return _getYearView(year);
      },
    );
  }
}
