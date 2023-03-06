import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star_book/presentation/utils/extension.dart';

enum PickerComponent { date, month, year }

class DatePicker extends StatelessWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime)? onDateChanged;
  DatePicker({
    super.key,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    this.onDateChanged,
  })  : initialDate = initialDate ?? DateTime.now(),
        firstDate = firstDate ?? DateTime(1970),
        lastDate = lastDate ?? DateTime(2050);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    return Container(
      height: deviceHeight * 0.25,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: PickerWidget(
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        onDateChanged: onDateChanged,
      ),
    );
  }
}

class PickerWidget extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime)? onDateChanged;

  const PickerWidget({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.onDateChanged,
  });

  @override
  State<PickerWidget> createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  /// Current Date
  late DateTime currentDate;

  /// Setting range of date picker
  late DateTime? firstValue;
  late DateTime? lastValue;

  @override
  void initState() {
    super.initState();
    currentDate = widget.initialDate;
    firstValue = widget.firstDate;
    lastValue = widget.lastDate;
  }

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
    return Row(
      children: [
        _PickerItem(
          onIncrement: (value) {
            onIncrement(PickerComponent.month);
          },
          onDecrement: (value) {
            onDecrement(PickerComponent.month);
          },
          value: _month,
          name: 'Month',
        ),
        _PickerItem(
          onIncrement: (value) {
            onIncrement(PickerComponent.date);
          },
          onDecrement: (value) {
            onDecrement(PickerComponent.date);
          },
          value: _day,
          name: 'Day',
        ),
        _PickerItem(
          onIncrement: (value) {
            onIncrement(PickerComponent.year);
          },
          onDecrement: (value) {
            onDecrement(PickerComponent.year);
          },
          value: _year,
          name: 'Year',
        ),
      ],
    );
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

class _PickerItem<T> extends StatelessWidget {
  final Function(T value) onIncrement;
  final Function(T value) onDecrement;
  final T value;
  final String name;

  const _PickerItem({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.value,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_up_outlined),
            onTap: () {
              onDecrement(value);
            },
          ),
          const SizedBox(height: 6),
          Text(
            value.toString(),
            style:
                textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_down_outlined),
            onTap: () {
              onIncrement(value);
            },
          ),
        ],
      ),
    );
  }
}
