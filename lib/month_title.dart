import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/dates.dart';

class MonthTitle extends StatelessWidget {
  final int month;
  final List<String> customMonthNames;

  MonthTitle({
    @required this.month,
    this.customMonthNames,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3 - 11.0,
      margin: EdgeInsets.only(bottom: 10.0, left: 5.0),
      child: Text(
        getMonthName(month, customNames: customMonthNames),
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
      ),
    );
  }
}
