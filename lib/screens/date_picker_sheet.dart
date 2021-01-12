import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/my_container.dart';

/// Date Picker Screen widget displays option to switch between dates.

class DatePickerSheet extends StatefulWidget {
  int day;
  int month;
  int year;

  DatePickerSheet(this.day, this.month, this.year);

  @override
  _DatePickerSheetState createState() => _DatePickerSheetState();
}

class _DatePickerSheetState extends State<DatePickerSheet> {
  c.TextEditingController dateController = new c.TextEditingController();
  int day, month, year;

  @override
  void initState() {
    super.initState();
    dateController.text = '${widget.day}-${widget.month}-${widget.year}';
    day = widget.day;
    month = widget.month;
    year = widget.year;
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  c.CupertinoNavigationBar _buildNavBar(BuildContext context) {
    return c.CupertinoNavigationBar(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      middle: Text("Date"),
      border: null,
    );
  }

  Widget _buildBody(BuildContext context) {
    return c.SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            c.SizedBox(
              height: 20,
            ),
            MyContainer(
              child: c.CupertinoTextField(
                textAlign: TextAlign.center,
                style: c.TextStyle(
                    fontSize: 20,
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w400),
                readOnly: true,
                placeholder: '$day-$month-$year',
                decoration: null,
                controller: dateController,
                maxLines: 1,
                onTap: null,
              ),
            ),
            c.SizedBox(
              height: 30,
            ),
            c.Center(
                child: Text(
              "Choose Another Date",
              style: TextStyle(color: c.Color(0xffffffff)),
            )),
            c.Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 2 / 5,
              child: c.CupertinoDatePicker(
                initialDateTime:
                    DateTime(widget.year, widget.month, widget.day),
                onDateTimeChanged: (DateTime newdate) {
                  setState(() {
                    day = newdate.day;
                    month = newdate.month;
                    year = newdate.year;
                    print("State Updated");
                  });
                  dateController.text = '$day-$month-$year';
                },
                use24hFormat: true,
                maximumDate: DateTime.now(),
                minimumYear: widget.year,
                maximumYear: widget.year,
                mode: c.CupertinoDatePickerMode.date,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({"day": day, "month": month, "year": year});
        return true;
      },
      child: c.CupertinoPageScaffold(
        backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6,
          context,
        ),
        navigationBar: _buildNavBar(context),
        child: _buildBody(context),
      ),
    );
  }
}
