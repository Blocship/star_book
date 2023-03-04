import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/home_screen_cubit.dart';
import 'package:star_book/domain/models/mood/day.dart';
import 'package:star_book/domain/models/mood/mood_info.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_create_screen.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/calendar.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/month_details.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class MonthScreen extends StatelessWidget {
  final MonthDetails monthDetails;

  const MonthScreen({
    Key? key,
    required this.monthDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final double deviceWidth = context.deviceWidth;
    final double deviceHeight = context.deviceHeight;

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
        leadingText: 'Year',
        leadingOnTap: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: deviceHeight * 0.032),
            SizedBox(
              width: deviceWidth * 0.84,
              child: Text(
                CalendarUtils.getFullMonthName(monthDetails.month),
                textAlign: TextAlign.left,
                style: textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: deviceHeight * 0.045),
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
          onTap: () {
            context.pushScreen(
              arg: JournalCreateScreenRoute(day: Day.today()),
            );
          },
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
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;

    List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return SizedBox(
      width: deviceWidth * 0.933,
      height: deviceHeight * 0.04,
      child: ListView.builder(
        itemCount: weekDays.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: deviceWidth * 0.133,
            height: deviceHeight * 0.064,
            child: Text(
              weekDays[index],
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: themeColorStyle.secondaryColor,
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
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    final TextTheme textTheme = context.textTheme;
    return BlocProvider<HomeScreenCubit>(
      create: (context) => HomeScreenCubit(
        moodRepo: Injector.resolve<MoodRepo>(),
      ),
      child: BlocBuilder<HomeScreenCubit, CubitState<MoodInfo>>(
        builder: (context, state) {
          // final get = context.read<HomeScreenCubit>().getMoodInfoByDate(day: day);
          return GestureDetector(
            onTap: () {
              context.pushScreen(
                arg: JournalCreateScreenRoute(day: Day.today()),
              );
            },
            child: Container(
              width: deviceWidth * 0.133,
              height: deviceHeight * 0.064,
              alignment: Alignment.center,
              child: Text(
                day < 1 ? '' : day.toString(),
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          );
        },
      ),
    );
  }
}
