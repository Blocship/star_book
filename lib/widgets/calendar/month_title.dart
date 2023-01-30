import 'package:flutter/material.dart';
import 'package:star_book/utils/dates.dart';

class MonthTitle extends StatelessWidget {
  const MonthTitle({
    super.key,
    required this.month,
  });

  final int month;

  @override
  Widget build(BuildContext context) {
    return Text(
      Dates.getMonthName(month),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      maxLines: 1,
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }
}
