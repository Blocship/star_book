import 'package:flutter/material.dart';
import 'package:star_book/utils/dates.dart';

class MonthTitle extends StatelessWidget {
  const MonthTitle({
    @required this.month,
    this.monthNames,
  });

  final int month;
  final List<String> monthNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        getMonthName(month, monthNames: monthNames),
        style: TextStyle(
          fontSize: 34.0,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
      ),
    );
  }
}
