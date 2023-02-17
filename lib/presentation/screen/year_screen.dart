import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/screen/calendar/custom_calendar.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

class YearScreen extends StatelessWidget {
  const YearScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.arrow_back_ios_new_outlined,
          label: 'Back',
          onTap: () => context.goNamed('MainScreen'),
        ),
        center: 'Year',
      ),
      body: const CustomCalendar(),
    );
  }
}
