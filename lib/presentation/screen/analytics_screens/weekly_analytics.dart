import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/cubits/analytiics_screen_cubit.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/domain/models/mood/mood_frequency.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/shared/legends_chart.dart';
import 'package:star_book/presentation/shared/loader.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/widgets/doughnut_chart.dart';

class WeeklyAnalyticsTab extends StatelessWidget {
  const WeeklyAnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    // final DoughnutChartStyle doughnutChartStyle = context.doughnutChartStyle;

    return BlocProvider<AnalyticsScreenCubit>(
      create: (context) => AnalyticsScreenCubit(
        moodRepo: Injector.resolve<MoodRepo>(),
      )..getMoodFrequencyByRange(
          start: DateTime.now().subtract(const Duration(days: 7)),
          end: DateTime.now()),
      child: BlocBuilder<AnalyticsScreenCubit, CubitState<MoodFrequency>>(
        builder: (context, state) {
          return state.when(
              initial: () => const Loader(),
              loading: () => const Loader(),
              loaded: (mood) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CustomPadding.mediumPadding),
                  child: Column(
                    children: [
                      MoodDoughnutChart(moodDataMap: mood.info),
                      SizedBox(height: deviceHeight * 0.05),
                      const SelectableTab(),
                      SizedBox(height: deviceHeight * 0.03),
                      const LegendsChart(),
                    ],
                  ),
                );
              },
              error: (e) => Text(e.toString()));
        },
      ),
    );
  }
}

class SelectableTab extends StatefulWidget {
  const SelectableTab({super.key});

  @override
  State<SelectableTab> createState() => _SelectableTabState();
}

class _SelectableTabState extends State<SelectableTab> {
  String _selectedTab = 'Mon';

  final List<String> _daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    return BlocBuilder<AnalyticsScreenCubit, CubitState<MoodFrequency>>(
      builder: (context, state) {
        // final getMoodFreqByDay = context.read<AnalyticsScreenCubit>().getMoodFrequencyByDay(day: day, month:month, year: year);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _daysOfWeek.map((day) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = day;
                });
              },
              child: Container(
                width: deviceWidth * 0.105,
                height: deviceHeight * 0.03,
                decoration: BoxDecoration(
                  color: (day == _selectedTab)
                      ? themeColorStyle.secondaryColor
                      : themeColorStyle.secondaryColor.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Text(
                  day,
                  style: textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: (day == _selectedTab)
                        ? themeColorStyle.quinaryColor
                        : themeColorStyle.secondaryColor,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
