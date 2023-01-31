import 'package:flutter/material.dart';

class YearTitle extends StatelessWidget {
  const YearTitle(this.year, {super.key});

  final int year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Text(
        year.toString(),
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
