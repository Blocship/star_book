import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';
import '../utils/date.dart';
import '../widgets/day.dart';

class Month extends StatelessWidget {
  Month({
    // @required this.activityList,
    @required this.month,
    @required this.year,
  });

  // final List<Activity> activityList;
  final int month;
  final int year;

  Widget _daysGrid(BuildContext context) {
    final List<Row> dayRowsList = new List<Row>();
    final List<Day> daysList = new List<Day>();

    final int daysInMonth = getDaysInMonth(year, month);
    final int fistWeekDay = DateTime(year, month, 1).weekday;

    for (int day = 2 - fistWeekDay; day <= daysInMonth; day++) {
      if (day <= 0) {
        daysList.add(new Day());
      } else {
        daysList.add(new Day(activity: new Activity(day: day)));
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
      children: [MonthTitle(month, year), ...dayRowsList],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _daysGrid(context),
    );
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
        // style: Theme.of(context).textTheme.headline3),
        style: c.CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
