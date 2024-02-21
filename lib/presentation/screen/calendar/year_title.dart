import 'package:flutter/material.dart';
import 'package:star_book/presentation/utils/extension.dart';

class YearTitle extends StatelessWidget {
  const YearTitle(this.year, {super.key});

  final int year;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Text(
        year.toString(),
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
