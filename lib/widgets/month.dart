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
  final double size;
  final Function ontap;

  Month({
    @required this.month,
    @required this.year,
    this.size,
    this.ontap,
  });

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends c.State<Month> {
  Activity _getActivity(int day) {
    return ActivityController.readAt(day, widget.month, widget.year);
  }

  // Widget _daysGrid(BuildContext context) {
  //   final List<Row> dayRowsList = new List<Row>();
  //   final List<Day> daysList = new List<Day>();

  //   final int daysInMonth = getDaysInMonth(widget.year, widget.month);
  //   final int fistWeekDay = DateTime(widget.year, widget.month, 1).weekday;

  //   for (int day = 2 - fistWeekDay; day <= daysInMonth; day++) {
  //     if (day <= 0) {
  //       daysList.add(new Day());
  //     } else {
  //       daysList.add(new Day(activity: _getActivity(day)));
  //     }

  //     bool weekDone = (day - 1 + fistWeekDay) % DateTime.daysPerWeek == 0;
  //     bool monthDone = day == daysInMonth;
  //     if (weekDone || monthDone) {
  //       dayRowsList.add(
  //         Row(children: List<Day>.from(daysList)),
  //       );
  //       daysList.clear();
  //     }
  //   }
  //   return Column(
  //     children: [MonthTitle(widget.month, widget.year), ...dayRowsList],
  //   );
  // }

  Widget _daysGrid(BuildContext context) {
    final int daysInMonth = getDaysInMonth(widget.year, widget.month);
    final int fistWeekDay = DateTime(widget.year, widget.month, 1).weekday;
    final daysList = new List<Day>();
    for (int day = 2 - fistWeekDay; day <= daysInMonth; day++) {
      if (day <= 0) {
        daysList.add(new Day());
      } else {
        daysList.add(new Day(activity: _getActivity(day)));
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
        return Container(
          child: c.Column(
            children: [
              MonthTitle(month: widget.month, year: widget.year),
              _daysGrid(context),
            ],
          ),
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

  MonthTitle({
    this.month,
    this.year,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(14, 10, 0, 10),
      child: Text(
        "${getMonthTitle(month)} $year",
        style: Style.largeTitle(context),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
