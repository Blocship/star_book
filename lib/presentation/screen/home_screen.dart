import 'package:flutter/material.dart';
import 'package:star_book/floating_action_button.dart';
import 'package:star_book/presentation/screen/calendar/month_days.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.keyboard_arrow_left_outlined,
          label: 'Year',
        ),
      ),
      body: DaysOfMonth(year: DateTime.now().year, month: DateTime.now().month),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: PrimaryFloatingActionButton(
          onTap: () {},
          child: const Image(
            image: AssetImage('assets/icons/calendar_add_on.png'),
            height: 20,
          ),
        ),
      ),
    );
  }
}
