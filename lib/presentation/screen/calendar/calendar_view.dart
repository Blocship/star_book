import 'package:flutter/material.dart';
import 'package:star_book/presentation/screen/calendar/custom_calendar_card.dart';
import 'package:star_book/presentation/screen/calendar/year_title.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({
    super.key,
    required this.year,
  });

  final int year;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.42,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: screenHeight * 0.02),
          YearTitle(year),
          SizedBox(height: screenHeight * 0.03),
          CalendarMonthView(year: year),
        ],
      ),
    );
  }
}

class CalendarMonthView extends StatelessWidget {
  final int year;

  const CalendarMonthView({
    Key? key,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.32,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: 12,
        itemBuilder: (context, index) {
          /// It will display grid of months
          return CustomCalendarCard(
            monthIndex: index + 1,
            year: year,
          );
        },
      ),
    );
  }
}
