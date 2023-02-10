import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum PickerComponent { date, month, year }

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  /// Current Date
  DateTime currentDate = DateTime.now();

  /// Setting range of date picker
  DateTime? firstValue = DateTime(1970);
  DateTime? lastValue = DateTime(2050);

  /// getters for day, month and year
  String get _day => currentDate.day.toString();

  String get _month => DateFormat.MMM().format(currentDate);

  String get _year => currentDate.year.toString();

  /// getters for total days in month
  int get daysInMonth =>
      DateUtils.getDaysInMonth(currentDate.year, currentDate.month);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Row(
          children: [
            pickerWidget(
                data: _month, pickerDateComponent: PickerComponent.month),
            pickerWidget(data: _day, pickerDateComponent: PickerComponent.date),
            pickerWidget(
                data: _year, pickerDateComponent: PickerComponent.year),
          ],
        ),
      ),
    );
  }

  Widget pickerWidget(
      {required String data, required PickerComponent pickerDateComponent}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_up_outlined),
            onTap: () {
              onDecrement(pickerDateComponent);
            },
          ),
          const SizedBox(height: 6),
          Text(
            data,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            getPickerDateComponentName(pickerDateComponent),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_down_outlined),
            onTap: () {
              onIncrement(pickerDateComponent);
            },
          ),
        ],
      ),
    );
  }

  /// Get Picker Component Name
  String getPickerDateComponentName(PickerComponent pickerDateComponent) {
    switch (pickerDateComponent) {
      case PickerComponent.date:
        return 'Date';
      case PickerComponent.month:
        return 'Month';
      case PickerComponent.year:
        return 'Year';
    }
  }

  /// On Arrow Up
  void onDecrement(PickerComponent pickerDateComponent) {
    switch (pickerDateComponent) {
      /// When it is call for date
      case PickerComponent.date:
        int yDay = currentDate.day - 1 > 0
            ? currentDate.day - 1
            : DateUtils.getDaysInMonth(currentDate.year, currentDate.month);
        DateTime tempDate = DateTime(currentDate.year, currentDate.month, yDay);

        setState(() {
          currentDate = tempDate;
          if (tempDate.compareTo(firstValue!) >= 0) {
            currentDate = tempDate;
          }
        });
        break;

      /// When it is call for month
      case PickerComponent.month:
        int lastMonth = currentDate.month - 1 > 0 ? currentDate.month - 1 : 12;

        int maxDays = DateUtils.getDaysInMonth(currentDate.year, lastMonth);
        DateTime tempDate = DateTime(currentDate.year, lastMonth,
            maxDays < currentDate.day ? maxDays : currentDate.day);

        setState(() {
          currentDate = tempDate;
          if (tempDate.compareTo(firstValue!) >= 0) {
            currentDate = tempDate;
          }
        });
        break;

      /// When it is call for year
      case PickerComponent.year:
        DateTime tempDate =
            DateTime(currentDate.year - 1, currentDate.month, currentDate.day);

        setState(() {
          currentDate = tempDate;
          if (tempDate.compareTo(firstValue!) >= 0) {
            currentDate = tempDate;
          }
        });
        break;
    }
  }

  /// On Arrow Down
  void onIncrement(PickerComponent pickerDateComponent) {
    switch (pickerDateComponent) {
      /// When it is call for date
      case PickerComponent.date:
        int numOfDays =
            DateUtils.getDaysInMonth(currentDate.year, currentDate.month);
        int tDay = currentDate.day + 1 <= numOfDays ? currentDate.day + 1 : 1;
        DateTime tempDate = DateTime(currentDate.year, currentDate.month, tDay);
        setState(() {
          currentDate = tempDate;
        });
        if (tempDate.compareTo(lastValue!) <= 0) {
          setState(() {
            currentDate = tempDate;
          });
        }
        break;

      /// When it is call for month
      case PickerComponent.month:
        int nextMonth = currentDate.month + 1 <= 12 ? currentDate.month + 1 : 1;
        int maxDays = DateUtils.getDaysInMonth(currentDate.year, nextMonth);

        setState(() {
          DateTime tempDate = DateTime(currentDate.year, nextMonth,
              maxDays < currentDate.day ? maxDays : currentDate.day);
          currentDate = tempDate;
          if (tempDate.compareTo(lastValue!) <= 0) {
            currentDate = tempDate;
          }
        });
        break;

      /// When it is call for year
      case PickerComponent.year:
        DateTime tempDate =
            DateTime(currentDate.year + 1, currentDate.month, currentDate.day);
        setState(() {
          currentDate = tempDate;
          if (tempDate.compareTo(lastValue!) <= 0) {
            currentDate = tempDate;
          }
        });
        break;
    }
  }
}
