import 'package:flutter/material.dart';
import 'package:star_book/utils/screen_sizes.dart';
import 'package:star_book/widgets/calendar/month_view.dart';
import 'package:star_book/widgets/calendar/year_title.dart';

class YearView extends StatelessWidget {
  const YearView({
    super.key,
    required this.year,
  });

  final int year;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getYearViewHeight(context) * 0.65,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          YearTitle(year),
          Months(year: year),
        ],
      ),
    );
  }
}

class Months extends StatelessWidget {
  final int year;

  const Months({
    Key? key,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> monthName = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return SizedBox(
      height: 300,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: monthName.length,
        itemBuilder: (context, index) {
          return CustomCalendarCard(
            monthName: monthName[index],
            year: year,
          );
        },
      ),
    );
  }
}

class CustomCalendarCard extends StatelessWidget {
  final int year;
  final String monthName;

  const CustomCalendarCard({
    Key? key,
    required this.monthName,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuildMonthView(
                  year: year,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                monthName,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildMonthView extends StatelessWidget {
  final int year;

  const BuildMonthView({
    Key? key,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Row> monthRows = <Row>[];
    final List<MonthView> monthRowChildren = <MonthView>[];
    for (int month = 1; month <= DateTime.monthsPerYear; month++) {
      monthRowChildren.add(
        MonthView(
          year: year,
          month: month,
        ),
      );

      if (month % 3 == 0) {
        monthRows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<MonthView>.from(monthRowChildren),
          ),
        );
        monthRowChildren.clear();
      }
    }

    return Column(
      children: List<Row>.from(monthRows),
    );
  }
}
