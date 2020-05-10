import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';
import 'package:star_book/utils/screen_sizes.dart';

class DayWidget extends StatelessWidget {
  DayWidget({@required this.day, this.onDayPressed});

  final Day day;
  final Function onDayPressed;
  // String diary_text or tag for now,

  @override
  Widget build(BuildContext context) {
    final double size = 44;
    final int _day = this.day.day;
    final Color _color = this.day.color;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: _color != null
          ? BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(size / 2),
            )
          : null,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            onDayPressed(day);
          },
          child: Text(
            _day < 1 ? '' : _day.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: day.color != null ? Colors.white : Colors.black87,
              fontSize: screenSize(context) == ScreenSizes.small ? 16.0 : 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
