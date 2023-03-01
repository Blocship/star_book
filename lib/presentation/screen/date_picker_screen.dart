import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/cubits/mood_picker_cubit.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/widgets/date_picker.dart';

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    return BlocProvider<DatePickerCubit>(
      create: (context) => DatePickerCubit(),
      child: Scaffold(
        appBar: PrimaryAppBar(
          leadingOnTap: () => context.pop(),
          centerTitle: 'Select Date',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomPadding.mediumPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Container(
                height: deviceHeight * 0.06,
                decoration: BoxDecoration(
                  color: themeColorStyle.septenaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  'MM--DD--YY',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: themeColorStyle.secondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const DatePicker(),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<DatePickerCubit, DateTime>(
          builder: (context, state) {
            return SecondaryFloatingActionButton(
              onTap: () {
                context
                    .goNamed(AppRouterName.journalCreateScreen, queryParams: {
                  'day': state.day.toString(),
                  'month': state.month.toString(),
                  'year': state.year.toString(),
                });
              },
              child: const Icon(Icons.check),
            );
          },
        ),
      ),
    );
  }
}
