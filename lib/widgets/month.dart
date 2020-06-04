import 'package:flutter/material.dart';
import 'package:star_book/models/activity.dart';
import 'package:star_book/utils/dates.dart';
import 'package:star_book/utils/dayWidget_size.dart';
import 'package:star_book/utils/tag_to_color.dart';
import 'package:star_book/widgets/day.dart';
import 'package:star_book/widgets/month_title.dart';

class MonthWidget extends StatefulWidget {
  MonthWidget({
    @required this.context,
    @required this.year,
    @required this.month,
  });

  final BuildContext context;
  final int year;
  final int month;
  final Color currentDateColor = Colors.blueGrey;

  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
// the list of highlighted day,
  // this will be coming from and stored in
  // database later.
  List<Activity> highlightedDays = [
    new Activity(day: 1, mood: "green", detail: "I had a very happy day"),
    new Activity(day: 3, mood: "blue", detail: "My day was normal"),
    new Activity(day: 5, mood: "red", detail: "I was very angry today"),
  ];

  // onpressed event, calls on pressing on day.
  // updates the highlighted days list
  onDayPressed(Activity day) {
    highlightedDays.removeWhere((d) => d.day == day.day);
    setState(() {
      highlightedDays
          .add(Activity(day: day.day, mood: day.mood, detail: day.detail));
    });
  }

  Activity getHighlightedDay(DateTime date) {
    Activity hDay;
    if (highlightedDays != null) {
      highlightedDays.any((Activity day) {
        if (date
            .isAtSameMomentAs(DateTime(widget.year, widget.month, day.day))) {
          hDay = day;
          return true;
        } else {
          hDay = null;
          return false;
        }
      });
    }
    return hDay;
  }

  Widget buildMonthDays(BuildContext context) {
    final List<Row> dayRows = <Row>[];
    final List<DayWidget> dayRowChildren = <DayWidget>[];
    final int daysInMonth = getDaysInMonth(widget.year, widget.month);
    final int firstWeekdayOfMonth =
        DateTime(widget.year, widget.month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      Activity hDay;
      if (day > 0) {
        hDay = getHighlightedDay(DateTime(widget.year, widget.month, day));
        // getDayWidgetTag
        // getDayWidgetDetail
      }
      dayRowChildren.add(DayWidget(
          day: hDay != null ? hDay : Activity(day: day),
          color: hDay != null ? getColor(hDay.mood) : null,
          onDayPressed: onDayPressed));

      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<DayWidget>.from(dayRowChildren),
          ),
        );
        dayRowChildren.clear();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dayRows,
    );
  }

  Widget buildMonthWidget(BuildContext context) {
    return Container(
      width: 7 * getDayWidgetSize(),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthTitle(
            month: widget.month,
            monthNames: null,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: buildMonthDays(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildMonthWidget(context),
    );
  }
}
