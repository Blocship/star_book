import 'package:flutter/material.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/home_screen.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/calendar.dart';
import 'package:star_book/presentation/utils/extension.dart';

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
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.goToScreen(
              arg: HomeScreenRoute(
                month: monthIndex,
                year: year,
              ),
            );
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: themeColorStyle.quinaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                CalendarUtils.getMonthName(monthIndex),
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
