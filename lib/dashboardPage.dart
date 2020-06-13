import 'package:flutter/material.dart';
import 'package:star_book/widgets/month.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DateTime date = DateTime.now();

  void _onPrevPressed() {
    setState(() {
      date = new DateTime(date.year, date.month - 1);
    });
  }

  void _onNextPressed() {
    setState(() {
      date = new DateTime(date.year, date.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(onPressed: _onPrevPressed, child: Text("Prev")),
                Text("${date.year}, ${date.month}"),
                FlatButton(onPressed: _onNextPressed, child: Text("Next")),
              ],
            ),
            MonthWidget(context: context, year: date.year, month: date.month),
          ],
        ),
      ),
    );
  }
}
