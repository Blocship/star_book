import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Files
import '../controllers/activity.dart';
import '../models/activity.dart';
import '../styles/style.dart';
import '../utils/date.dart';
import '../widgets/day.dart';

/// Month widget arranges the [Day]s in rows and columns to make calendar
/// for given month and year.
/// And also give [MonthTitle]
class Month extends StatefulWidget {
  final int month;
  final int year;
  final bool onPressed;
  final bool showMonthTitle;

  Month({
    required this.month,
    required this.year,
    this.showMonthTitle = true,
    this.onPressed = false,
  });

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends c.State<Month> {
  Activity? _getActivity(int day) {
    return ActivityController.readAt(day, widget.month, widget.year);
  }

  Widget _daysGrid(BuildContext context) {
    final int daysInMonth = getDaysInMonth(widget.year, widget.month);
    final int fistWeekDay = DateTime(widget.year, widget.month, 1).weekday;
    final daysList = <Widget>[];
    for (int day = 2 - fistWeekDay; day <= daysInMonth; day++) {
      if (day <= 0) {
        daysList.add(const Day());
      } else {
        daysList.add(Day(
          activity: _getActivity(day),
          onPressed: (widget.onPressed == false),
        ));
      }
    }

    return GridView.count(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 7,
      children: daysList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Activity>(activityBoxName).listenable(),
      builder: (context, Box<Activity> box, _) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double _size = constraints.maxWidth;
            // print('month size: $_size');
            return c.CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (widget.onPressed)
                  ? () {
                      print('navigate to home');
                    }
                  : null,
              child: Column(
                children: [
                  if (widget.showMonthTitle)
                    MonthTitle(
                      month: widget.month,
                      year: widget.year,
                      size: _size,
                    ),
                  _daysGrid(context),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/// Month Title widget
///
/// for example:
/// ## December 2020
class MonthTitle extends StatelessWidget {
  final int month;
  final int year;
  final double size;
  final String _getYear;

  static const int _thresh = 200;
  MonthTitle({
    required this.month,
    required this.year,
    required this.size,
  })  : assert(size <= _thresh || (size > _thresh && year != null)),
        _getYear = (size < _thresh) ? '' : year.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 10, 0, 10),
      child: Text(
        '${getMonthTitle(month)} $_getYear',
        style: (size < _thresh) ? Style.footerNoteSecondary(context) : Style.largeTitle(context),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
