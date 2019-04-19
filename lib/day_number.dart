import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';

class DayNumber extends StatelessWidget {
  final int day;
  final bool isToday;
  final Color todayColor;

  DayNumber({
    @required this.day,
    this.isToday,
    this.todayColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    double size = getDayNumberSize(context);

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: this.isToday
          ? BoxDecoration(
              color: this.todayColor,
              borderRadius: BorderRadius.circular(size / 2),
            )
          : null,
      child: Text(
        this.day < 1 ? '' : this.day.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: this.isToday ? Colors.white : Colors.black87,
          fontSize: screenSize(context) == ScreenSizes.small ? 8.0 : 10.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
