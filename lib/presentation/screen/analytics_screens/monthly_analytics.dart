import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/models/mood/mood_frequency.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/presentation/cubits/analytiics_screen_cubit.dart';
import 'package:star_book/presentation/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/shared/legends_chart.dart';
import 'package:star_book/presentation/shared/loader.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/doughnut_chart.dart';

class MonthlyAnalyticsTab extends StatelessWidget {
  const MonthlyAnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;

    final currentDate = DateTime.now();
    return BlocProvider<AnalyticsScreenCubit>(
      create: (context) => AnalyticsScreenCubit(
        moodRepo: Injector.resolve<MoodRepo>(),
      )..getMoodFrequencyByMonth(
          month: currentDate.month, year: currentDate.year),
      child: BlocBuilder<AnalyticsScreenCubit, CubitState<MoodFrequency>>(
        builder: (context, state) {
          return state.when(
              initial: () => const SizedBox(),
              loading: () => const Loader(),
              loaded: (mood) {
                if (mood.info.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CustomPadding.mediumPadding),
                    child: Column(
                      children: [
                        MoodDoughnutChart(
                            isDataEmpty: true,
                            moodDataMap: {
                          const Mood(
                              id: '',
                              label: 'Productive',
                              color: 0xFF32C74F): 20,
                          const Mood(id: '', label: 'Angry', color: 0xFFFF3932):
                              20,
                          const Mood(id: '', label: 'Sick', color: 0xFFFF9600):
                              20,
                          const Mood(id: '', label: 'Sad', color: 0xFF565AC9):
                              20,
                          const Mood(id: '', label: 'Happy', color: 0xFF0179FF):
                              20,
                        }),
                        SizedBox(height: deviceHeight * 0.05),
                        const SelectableTab(),
                        SizedBox(height: deviceHeight * 0.03),
                        const LegendsChart(),
                      ],
                    ),
                  );
                }
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
