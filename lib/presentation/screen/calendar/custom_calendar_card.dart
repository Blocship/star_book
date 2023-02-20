import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:star_book/presentation/utils/calendar.dart';
import 'package:star_book/routes/app_router_name.dart';

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
            context.goNamed(AppRouterName.monthScreen, params: {
              'year': year.toString(),
              'month': monthIndex.toString(),
              'isHomeScreen': false.toString(),
            });
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
