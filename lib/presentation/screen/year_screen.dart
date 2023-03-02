import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/calendar/custom_calendar.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class YearScreenRoute extends RouteArg {
  static const String path = '/main/year';

  const YearScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class YearScreen extends StatelessWidget implements Screen<YearScreenRoute> {
  @override
  final YearScreenRoute arg;

  const YearScreen({super.key, required this.arg});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: PrimaryAppBar(
        leadingOnTap: () => context.pop(),
        centerTitle: 'Year',
      ),
      body: const CustomCalendar(),
    );
  }
}
