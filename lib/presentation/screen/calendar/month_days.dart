import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:star_book/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/utils/calendar.dart';
import 'package:star_book/presentation/utils/month_details.dart';
import 'package:star_book/routes/app_router_name.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

class MonthScreen extends StatelessWidget {
  final MonthDetails monthDetails;
  const MonthScreen({
    Key? key,
    required this.monthDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<Row> dayRows = <Row>[];
    final List<Date> dayRowChildren = <Date>[];

    /// It will give total days in the months
    final int daysInMonth =
        CalendarUtils.getDaysInMonth(monthDetails.year, monthDetails.month);

    /// It will let you know the first day of the week of the given year and month
    final int firstWeekdayOfMonth =
        DateTime(monthDetails.year, monthDetails.month, 1).weekday;

    for (int day = 2 - firstWeekdayOfMonth; day <= daysInMonth; day++) {
      dayRowChildren.add(Date(day: day));

      /// Move to new row
      if ((day - 1 + firstWeekdayOfMonth) % DateTime.daysPerWeek == 0 ||
          day == daysInMonth) {
        dayRows.add(
          Row(
            children: List<Date>.from(dayRowChildren),
          ),
        );
        dayRowChildren.clear();
      }
    }

    /// This will display the week days and dates of the month
    return GradientScaffold(
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.arrow_back_ios_new_outlined,
          label: 'Year',
          onTap: () => context.goNamed(AppRouterName.yearScreen),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 25),
            SizedBox(
              width: screenWidth * 0.84,
              child: Text(
                CalendarUtils.getFullMonthName(monthDetails.month),
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                WeekDaysView(),
              ],
            ),
            Column(
              children: dayRows,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: (monthDetails.isHomeScreen) ? 90 : 20),
        child: PrimaryFloatingActionButton(
          onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
          child: const Image(
            image: AssetImage('assets/icons/calendar_add_on.png'),
            height: 20,
          ),
        ),
      ),
    );
  }
}

class WeekDaysView extends StatelessWidget {
  const WeekDaysView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return SizedBox(
      width: screenWidth * 0.933,
      height: screenHeight * 0.04,
      child: ListView.builder(
        itemCount: weekDays.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 48,
            height: 50,
            child: Text(
              weekDays[index],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .secondaryColor,
                  ),
            ),
          );
        },
      ),
    );
  }
}

class Date extends StatelessWidget {
  const Date({
    super.key,
    required this.day,
  });

  final int day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
      child: Container(
        width: 48,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          day < 1 ? '' : day.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
