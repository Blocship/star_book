import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../widgets/my_container.dart';

/// Date Picker Screen displays option to switch between dates
/// from 1st of this month to current date of present month.
class DatePickerSheet extends StatefulWidget {
  final RouteSettings settings;
  DatePickerSheet(this.settings);

  @override
  _DatePickerSheetState createState() => _DatePickerSheetState();
}

class _DatePickerSheetState extends State<DatePickerSheet> {
  TextEditingController dateController = TextEditingController();
  int day, month, year;

  @override
  void initState() {
    super.initState();
    var data = widget.settings.arguments as Map<String, int>;
    day = data['day'];
    month = data['month'];
    year = data['year'];
    dateController.text = '$day-$month-$year';
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({'day': day, 'month': month, 'year': year});
        return true;
      },
      child: c.CupertinoPageScaffold(
        backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6,
          context,
        ),
        navigationBar: c.CupertinoNavigationBar(
          backgroundColor: c.CupertinoDynamicColor.resolve(
            c.CupertinoColors.systemGrey6,
            context,
          ),
          middle: Text('Date'),
          border: null,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                MyContainer(
                  child: c.CupertinoTextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    placeholder: '$day-$month-$year',
                    decoration: null,
                    controller: dateController,
                    maxLines: 1,
                    onTap: null,
                    style: TextStyle(
                      color: c.CupertinoDynamicColor.resolve(
                          c.CupertinoColors.label, context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Choose Another Date',
                    style: TextStyle(
                      color: c.CupertinoDynamicColor.resolve(
                          c.CupertinoColors.label, context),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 2 / 5,
                  child: c.CupertinoDatePicker(
                    initialDateTime: DateTime(year, month, day),
                    onDateTimeChanged: (DateTime newdate) {
                      setState(() {
                        day = newdate.day;
                        month = newdate.month;
                        year = newdate.year;
                      });
                      dateController.text = '$day-$month-$year';
                    },
                    use24hFormat: true,
                    maximumDate: DateTime.now(),
                    minimumYear: year,
                    maximumYear: year,
                    mode: c.CupertinoDatePickerMode.date,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
