import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Files
import '../models/activity.dart';
import '../utils/date.dart';
import '../widgets/day.dart';

class Month extends c.StatefulWidget {
  Month({
    @required this.month,
    @required this.year,
  });

  final int month;
  final int year;

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends c.State<Month> {
  Activity _getActivity(int day) {
    final List<Activity> activityList =
        Hive.box<Activity>(activityBoxName).values.toList();
    // new List<Activity>.from(Hive.box<Activity>(activityBoxName).values);
    final Activity res = activityList.firstWhere(
      (element) =>
          element.day == day &&
          element.month == widget.month &&
          element.year == widget.year,
      orElse: () =>
          new Activity(day: day, month: widget.month, year: widget.year),
    );
    return res;
  }

  Widget _daysGrid(BuildContext context) {
    final List<Row> dayRowsList = new List<Row>();
    final List<Day> daysList = new List<Day>();

    final int daysInMonth = getDaysInMonth(widget.year, widget.month);
    final int fistWeekDay = DateTime(widget.year, widget.month, 1).weekday;

    for (int day = 2 - fistWeekDay; day <= daysInMonth; day++) {
      if (day <= 0) {
        daysList.add(new Day());
      } else {
        daysList.add(new Day(activity: _getActivity(day)));
      }

      bool weekDone = (day - 1 + fistWeekDay) % DateTime.daysPerWeek == 0;
      bool monthDone = day == daysInMonth;
      if (weekDone || monthDone) {
        dayRowsList.add(
          Row(children: List<Day>.from(daysList)),
        );
        daysList.clear();
      }
    }
    return Column(
      children: [MonthTitle(widget.month, widget.year), ...dayRowsList],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<Activity>(activityBoxName).listenable(),
        builder: (context, Box<Activity> box, widget) {
          return Container(
            child: _daysGrid(context),
          );
        });
  }
}

class MonthTitle extends StatelessWidget {
  MonthTitle(this.month, this.year);

  final int month;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(14, 10, 0, 10),
      child: Text(
        "${getMonthTitle(month)} $year",
        style: c.CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
