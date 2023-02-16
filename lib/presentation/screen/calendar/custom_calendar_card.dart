import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/utils/calendar.dart';

class CustomCalendarCard extends StatelessWidget {
  final int year;
  final int monthIndex;

  const CustomCalendarCard({
    Key? key,
    required this.monthIndex,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            ///Todo: it will give error because it takes arguments
            context.go(
                '/introScreen/mainScreen/yearScreen/homeScreen/daysOfMonth');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DaysOfMonth(
            //       year: year,
            //       month: monthIndex,
            //     ),
            //   ),
            // );
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                CalendarUtils.getMonthName(monthIndex),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
