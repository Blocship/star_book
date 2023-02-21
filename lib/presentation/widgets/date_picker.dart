import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star_book/presentation/utils/extension.dart';

enum PickerComponent { date, month, year }

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    return Container(
      height: deviceHeight * 0.25,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: const PickerWidget(),
    );
  }
}

class PickerWidget extends StatefulWidget {
  const PickerWidget({Key? key}) : super(key: key);

  @override
  State<PickerWidget> createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
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
    final TextTheme textTheme = context.textTheme;
    return Row(children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: const Icon(Icons.keyboard_arrow_up_outlined),
              onTap: () {
                onDecrement(PickerComponent.month);
              },
            ),
            const SizedBox(height: 6),
            Text(
              _month,
              style: textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              getPickerDateComponentName(PickerComponent.month),
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              child: const Icon(Icons.keyboard_arrow_down_outlined),
              onTap: () {
                onIncrement(PickerComponent.month);
              },
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: const Icon(Icons.keyboard_arrow_up_outlined),
              onTap: () {
                onDecrement(PickerComponent.date);
              },
            ),
            const SizedBox(height: 6),
            Text(
              _day,
              style: textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              getPickerDateComponentName(PickerComponent.date),
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              child: const Icon(Icons.keyboard_arrow_down_outlined),
              onTap: () {
                onIncrement(PickerComponent.date);
              },
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: const Icon(Icons.keyboard_arrow_up_outlined),
              onTap: () {
                onDecrement(PickerComponent.year);
              },
            ),
            const SizedBox(height: 6),
            Text(
              _year,
              style: textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              getPickerDateComponentName(PickerComponent.year),
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              child: const Icon(Icons.keyboard_arrow_down_outlined),
              onTap: () {
                onIncrement(PickerComponent.year);
              },
            ),
          ],
        ),
      ),
    ]);
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
