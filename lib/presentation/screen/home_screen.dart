import 'package:flutter/material.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/calendar/month_days.dart';
import 'package:star_book/presentation/utils/month_details.dart';

class HomeScreenRoute extends RouteArg {
  // ?month=1&year=2023
  static const String path = 'month';
  final int? month;
  final int? year;
  const HomeScreenRoute({
    this.month,
    this.year,
  }) : super();

  @override
  Uri get uri => Uri(
        path: '/main/year/$path',
        queryParameters: {
          'month': month.toString(),
          'year': year.toString(),
        },
      );

  @override
  String get parsedPath => uri.toString();
}

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
