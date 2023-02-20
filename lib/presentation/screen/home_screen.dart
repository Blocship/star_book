import 'package:flutter/material.dart';
import 'package:star_book/presentation/screen/calendar/month_days.dart';
import 'package:star_book/presentation/utils/month_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MonthScreen(
      monthDetails: MonthDetails(
        year: DateTime.now().year,
        month: DateTime.now().month,
        isHomeScreen: true,
      ),
    );
  }
}
