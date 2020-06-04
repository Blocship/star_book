import 'package:flutter/material.dart';
import 'package:star_book/models/activity.dart';
import 'package:star_book/utils/dayWidget_size.dart';
import 'package:star_book/widgets/day_detail.dart';

class DayWidget extends StatelessWidget {
  DayWidget({@required this.day, this.color, this.onDayPressed});

  final Activity day;
  final Color color;
  final Function onDayPressed;
  // String diary_text or tag for now,

  // builds a day box.
  Widget _addText(BuildContext context, int _day) {
    return Text(
      _day < 1 ? '' : _day.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color != null ? Colors.white : Colors.black87,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _addTextWithButton(BuildContext context, int _day) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DayDetailPage(data: day)),
        );
        day.tag = result;
        onDayPressed(day);
      },
      child: _addText(context, _day),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double size = getDayWidgetSize();
    final int _day = this.day.day;
    final Color _color = color;

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
        child: _day < 1 ? null : _addTextWithButton(context, _day),
      ),
    );
  }
}
