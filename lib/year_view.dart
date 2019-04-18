import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/utils/screen_sizes.dart';
import 'package:scrolling_years_calendar/month_view.dart';

class YearView extends StatelessWidget {
  final int year;
  final BuildContext context;
  final Function onMonthClick;
  final Color currentDayColor;
  final List<String> customMonthNames;

  YearView({
    @required this.year,
    @required this.context,
    @required this.onMonthClick,
    @required this.currentDayColor,
    this.customMonthNames,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> allMonths = [];
    List<Widget> listWith3Months = [];

    // Loop through all months
    for (var month = 1; month < 13; month++) {
      // Add month
      listWith3Months.add(
        MonthView(
          context: context,
          currentDayColor: currentDayColor,
          year: year,
          month: month,
          onMonthClick: onMonthClick,
          customMonthNames: customMonthNames,
        ),
      );

      // Foreach 3 months add to list
      if (month % 3 == 0) {
        allMonths.add(
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.from(listWith3Months),
            ),
          ),
        );
        listWith3Months.clear();
      }
    }

    return Container(
      height: getYearViewHeight(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0, top: 25.0, left: 20.0),
            child: Text(
              year.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize:
                    screenSize(context) == ScreenSizes.small ? 22.0 : 26.0,
              ),
            ),
          ),
          Container(
            color: Colors.black26,
            height: 0.5,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            children: allMonths,
          ),
        ],
      ),
    );
  }
}
