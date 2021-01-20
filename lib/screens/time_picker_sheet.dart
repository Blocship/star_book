import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/my_container.dart';

/// Time Picker Screen displays option to switch select time for reminder.
class TimePickerSheet extends StatefulWidget {
  final RouteSettings settings;

  TimePickerSheet(this.settings);

  @override
  _TimePickerSheetState createState() => _TimePickerSheetState();
}

class _TimePickerSheetState extends State<TimePickerSheet> {
  c.TextEditingController timeController = new c.TextEditingController();
  DateTime _time;

  @override
  void initState() {
    super.initState();
    timeController.text;
  }

  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  c.CupertinoNavigationBar _buildNavBar(BuildContext context) {
    return c.CupertinoNavigationBar(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      middle: Text("Time"),
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
                placeholder: 'time',
                decoration: null,
                controller: timeController,
                maxLines: 1,
                onTap: null,
              ),
            ),
            c.SizedBox(
              height: 30,
            ),
            c.Center(
                child: Text(
                  "Choose Time",
                  style: TextStyle(color: c.Color(0xffffffff)),
                )),
            c.Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 2 / 5,
              child: c.CupertinoDatePicker(
                onDateTimeChanged: (DateTime time) {
                  setState(() {
                    _time = time;
                    timeController.text = '${_time.hour}:${_time.minute}';
                  });
                },
                use24hFormat: true,
                mode: c.CupertinoDatePickerMode.time,
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