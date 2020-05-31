import 'package:flutter/material.dart';
import 'package:star_book/widgets/month.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MonthWidget(context: context, year: 2020, month: 5),
      ),
    );
  }
}
