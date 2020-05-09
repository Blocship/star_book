import 'package:flutter/material.dart';
import 'package:star_book/utils/screen_sizes.dart';

class DayNumber extends StatelessWidget {
  DayNumber({
    @required this.day,
    this.color,
  });

  final int day;
  final Color color;
  // String diary_text or tag for now,

  @override
  Widget build(BuildContext context) {
    final double size = getDayNumberSize(context);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: color != null
          ? BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(size / 2),
            )
          : null,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          child: Text(
            day < 1 ? '' : day.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color != null ? Colors.white : Colors.black87,
              fontSize: screenSize(context) == ScreenSizes.small ? 16.0 : 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
