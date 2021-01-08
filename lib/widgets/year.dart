import 'package:flutter/material.dart';
import 'package:star_book/utils/screen_sizes.dart';
import 'package:star_book/utils/date.dart';

class Year extends StatelessWidget {
  const Year({
    @required this.context,
    @required this.year,
    this.monthNames,
    this.monthTitleStyle,
  });

  final BuildContext context;
  final int year;
  final List<String> monthNames;
  final TextStyle monthTitleStyle;

  double get horizontalMargin => 16.0;
  double get monthViewPadding => 8.0;

  Widget buildYearMonths(BuildContext context) {
    final List<Row> monthRows = <Row>[];
    final List<MonthTile> monthRowChildren = <MonthTile>[];

    for (int month = 1; month <= DateTime.monthsPerYear; month++) {
      monthRowChildren.add(
        MonthTile(
          context: context,
          year: year,
          month: month,
          padding: monthViewPadding,
          monthNames: monthNames,
        ),
      );

      if (month % 3 == 0) {
        monthRows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<MonthTile>.from(monthRowChildren),
          ),
        );
        monthRowChildren.clear();
      }
    }

    return Column(
      children: List<Row>.from(monthRows),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getYearViewHeight(context),
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin,
              vertical: 0.0,
            ),
            child: Text(
              year.toString(),
              style: TextStyle(
                fontSize: screenSize(context) == ScreenSizes.small ? 22.0 : 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: horizontalMargin,
              right: horizontalMargin,
              top: 8.0,
            ),
            child: Divider(
              color: Colors.black26,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin - monthViewPadding,
              vertical: 0.0,
            ),
            child: buildYearMonths(context),
          ),
        ],
      ),
    );
  }
}

class MonthTile extends StatelessWidget {
  const MonthTile({
    @required this.context,
    @required this.year,
    @required this.month,
    @required this.padding,
    this.monthNames,
    this.onTap,
  });
  final BuildContext context;
  final int year;
  final int month;
  final double padding;
  final List<String> monthNames;
  final Function onTap;

  Widget getDayRows(BuildContext context) {
    final List<Row> dayRows = <Row>[];
    final List<Widget> dayRowChildren = <Widget>[];

    final int daysInMonth = getDaysInMonth(year, month);
    final int firstWeekdayOfMonth = DateTime(year, month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      dayRowChildren.add(
          Container(
            width: getDayNumberSize(context),
            height: getDayNumberSize(context),
            alignment: Alignment.center,
            child: Text(
              day < 1 ? '' : day.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: screenSize(context) == ScreenSizes.small ? 8.0 : 10.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
      );
      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<Widget>.from(dayRowChildren),
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

  Widget buildMonthTile(BuildContext context) {
    return Container(
      width: 7 * getDayNumberSize(context),
      margin: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              getMonthTitle(month),
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: getDayRows(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildMonthTile(context),
    );
  }
}
