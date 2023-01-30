import 'package:flutter/material.dart';
import 'package:star_book/widgets/calendar/year_view.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  _CustomCalenderState createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  @override
  Widget build(BuildContext context) {
    /// [widget.lastDate.year] is the current year and [widget.firstDate.year] is
    /// past year, if [widget.lastDate.year] is 2023 then [widget.firstDate.year]
    /// is 2018, And itemCount is basically subtraction to get the number of
    /// years
    final int itemCount = widget.lastDate.year - widget.firstDate.year + 1;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 16.0),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          final int year = index + widget.firstDate.year;
          return YearView(year: year);
        },
      ),
    );
  }
}
