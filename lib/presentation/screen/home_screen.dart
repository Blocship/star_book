import 'package:flutter/material.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/calendar/month_days.dart';
import 'package:star_book/presentation/utils/month_details.dart';

class HomeScreen extends StatelessWidget implements Screen<HomeScreenRoute> {
  @override
  final HomeScreenRoute arg;

  const HomeScreen({
    super.key,
    required this.arg,
  });

  @override
  Widget build(BuildContext context) {
    return MonthScreen(
      monthDetails: MonthDetails(
        year: arg.year ?? DateTime.now().year,
        month: arg.month ?? DateTime.now().month,
        isHomeScreen: true,
      ),
    );
  }
}
