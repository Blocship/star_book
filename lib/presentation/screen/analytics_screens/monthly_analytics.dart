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

class MonthlyAnalyticsTab extends StatelessWidget {
  const MonthlyAnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    // final DoughnutChartStyle doughnutChartStyle = context.doughnutChartStyle;

    return BlocProvider<AnalyticsScreenCubit>(
      create: (context) => AnalyticsScreenCubit(
        moodRepo: Injector.resolve<MoodRepo>(),
      )..getMoodFrequencyByMonth(month: 5, year: 2023),
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
  String selectedMonths = 'Jan';

  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    return BlocBuilder<AnalyticsScreenCubit, CubitState<MoodFrequency>>(
      builder: (context, state) {
        // final getMoodFreqByMonth = context.read<AnalyticsScreenCubit>().getMoodFrequencyByMonth(month: month, year: year);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: months.map((month) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMonths = month;
                });
              },
              child: Container(
                width: deviceWidth * 0.105,
                height: deviceHeight * 0.03,
                decoration: BoxDecoration(
                  color: (month == selectedMonths)
                      ? themeColorStyle.secondaryColor
                      : themeColorStyle.secondaryColor.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Text(
                  month,
                  style: textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: (month == selectedMonths)
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
