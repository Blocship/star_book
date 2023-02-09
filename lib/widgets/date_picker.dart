import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum PickerDateComponent { day, month, year }

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now().toLocal();
  DateTime today = DateTime.now().toLocal();

  String get _day => currentDate.day.toString();

  String get _month => DateFormat.MMM().format(currentDate);

  String get _year => currentDate.year.toString();

  int get daysInMonth =>
      DateUtils.getDaysInMonth(currentDate.year, currentDate.month);

  DateTime? firstValue = DateTime(1970);
  DateTime? lastValue = DateTime(2050);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          pickerWidget(_day, PickerDateComponent.day),
          pickerWidget(_month, PickerDateComponent.month),
          pickerWidget(_year, PickerDateComponent.year),
        ],
      ),
    );
  }

  Widget pickerWidget(String data, PickerDateComponent pickerDateComponent) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_up_outlined),
            onTap: () {
              if (pickerDateComponent == PickerDateComponent.day) {
                int yDay = currentDate.day - 1 > 0
                    ? currentDate.day - 1
                    : DateUtils.getDaysInMonth(
                        currentDate.year, currentDate.month);
                DateTime tempDate =
                    DateTime(currentDate.year, currentDate.month, yDay);

                setState(() {
                  currentDate = tempDate;
                  if (tempDate.compareTo(firstValue!) >= 0) {
                    currentDate = tempDate;
                  }
                });
              } else if (pickerDateComponent == PickerDateComponent.month) {
                int lastMonth =
                    currentDate.month - 1 > 0 ? currentDate.month - 1 : 12;

                int maxDays =
                    DateUtils.getDaysInMonth(currentDate.year, lastMonth);
                DateTime tempDate = DateTime(currentDate.year, lastMonth,
                    maxDays < currentDate.day ? maxDays : currentDate.day);

                setState(() {
                  currentDate = tempDate;
                  if (tempDate.compareTo(firstValue!) >= 0) {
                    currentDate = tempDate;
                  }
                });
              } else if (pickerDateComponent == PickerDateComponent.year) {
                DateTime tempDate = DateTime(
                    currentDate.year - 1, currentDate.month, currentDate.day);

                setState(() {
                  currentDate = tempDate;
                  if (tempDate.compareTo(firstValue!) >= 0) {
                    currentDate = tempDate;
                  }
                });
              }
            },
          ),
          const SizedBox(height: 15),
          Text(
            data,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            child: const Icon(Icons.keyboard_arrow_down_outlined),
            onTap: () {
              if (pickerDateComponent == PickerDateComponent.day) {
                int numOfDays = DateUtils.getDaysInMonth(
                    currentDate.year, currentDate.month);
                int tDay =
                    currentDate.day + 1 <= numOfDays ? currentDate.day + 1 : 1;
                DateTime tempDate =
                    DateTime(currentDate.year, currentDate.month, tDay);
                setState(() {
                  currentDate = tempDate;
                });
                if (tempDate.compareTo(lastValue!) <= 0) {
                  setState(() {
                    currentDate = tempDate;
                  });
                }
              } else if (pickerDateComponent == PickerDateComponent.month) {
                int nextMonth =
                    currentDate.month + 1 <= 12 ? currentDate.month + 1 : 1;
                int maxDays =
                    DateUtils.getDaysInMonth(currentDate.year, nextMonth);

                setState(() {
                  DateTime tempDate = DateTime(currentDate.year, nextMonth,
                      maxDays < currentDate.day ? maxDays : currentDate.day);
                  currentDate = tempDate;
                  if (tempDate.compareTo(lastValue!) <= 0) {
                    currentDate = tempDate;
                  }
                });
              } else if (pickerDateComponent == PickerDateComponent.year) {
                DateTime tempDate = DateTime(
                    currentDate.year + 1, currentDate.month, currentDate.day);
                setState(() {
                  currentDate = tempDate;
                  if (tempDate.compareTo(lastValue!) <= 0) {
                    currentDate = tempDate;
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

// class PickerWidget extends StatefulWidget {
//   final String data;
//   final PickerDateComponent pickerDateComponent;
//   const PickerWidget({
//     Key? key,
//     required this.data,
//     required this.pickerDateComponent,
//   }) : super(key: key);
//
//   @override
//   State<PickerWidget> createState() => _PickerWidgetState();
// }
//
// class _PickerWidgetState extends State<PickerWidget> {
//   DateTime currentDate = DateTime.now().toLocal();
//   int get daysInMonth =>
//       DateUtils.getDaysInMonth(currentDate.year, currentDate.month);
//   DateTime? firstValue = DateTime(1970);
//   DateTime? lastValue = DateTime(2050);
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           GestureDetector(
//             child: const Icon(Icons.keyboard_arrow_up_outlined),
//             onTap: () {
//               if (widget.pickerDateComponent == PickerDateComponent.day) {
//                 int yDay = currentDate.day - 1 > 0
//                     ? currentDate.day - 1
//                     : DateUtils.getDaysInMonth(
//                         currentDate.year, currentDate.month);
//                 DateTime tempDate =
//                     DateTime(currentDate.year, currentDate.month, yDay);
//
//                 setState(() {
//                   currentDate = tempDate;
//                   if (tempDate.compareTo(firstValue!) >= 0) {
//                     currentDate = tempDate;
//                   }
//                 });
//               } else if (widget.pickerDateComponent ==
//                   PickerDateComponent.month) {
//                 int lastMonth =
//                     currentDate.month - 1 > 0 ? currentDate.month - 1 : 12;
//
//                 int maxDays =
//                     DateUtils.getDaysInMonth(currentDate.year, lastMonth);
//                 DateTime tempDate = DateTime(currentDate.year, lastMonth,
//                     maxDays < currentDate.day ? maxDays : currentDate.day);
//
//                 setState(() {
//                   currentDate = tempDate;
//                   if (tempDate.compareTo(firstValue!) >= 0) {
//                     currentDate = tempDate;
//                   }
//                 });
//               } else if (widget.pickerDateComponent ==
//                   PickerDateComponent.year) {
//                 DateTime tempDate = DateTime(
//                     currentDate.year - 1, currentDate.month, currentDate.day);
//
//                 setState(() {
//                   currentDate = tempDate;
//                   if (tempDate.compareTo(firstValue!) >= 0) {
//                     currentDate = tempDate;
//                   }
//                 });
//               }
//             },
//           ),
//           const SizedBox(height: 15),
//           Text(
//             widget.data,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 15),
//           GestureDetector(
//             child: const Icon(Icons.keyboard_arrow_down_outlined),
//             onTap: () {
//               if (widget.pickerDateComponent == PickerDateComponent.day) {
//                 int numOfDays = DateUtils.getDaysInMonth(
//                     currentDate.year, currentDate.month);
//                 int tDay =
//                     currentDate.day + 1 <= numOfDays ? currentDate.day + 1 : 1;
//                 DateTime tempDate =
//                     DateTime(currentDate.year, currentDate.month, tDay);
//                 setState(() {
//                   currentDate = tempDate;
//                 });
//                 if (tempDate.compareTo(lastValue!) <= 0) {
//                   setState(() {
//                     currentDate = tempDate;
//                   });
//                 }
//               } else if (widget.pickerDateComponent ==
//                   PickerDateComponent.month) {
//                 int nextMonth =
//                     currentDate.month + 1 <= 12 ? currentDate.month + 1 : 1;
//                 int maxDays =
//                     DateUtils.getDaysInMonth(currentDate.year, nextMonth);
//
//                 setState(() {
//                   DateTime tempDate = DateTime(currentDate.year, nextMonth,
//                       maxDays < currentDate.day ? maxDays : currentDate.day);
//                   currentDate = tempDate;
//                   if (tempDate.compareTo(lastValue!) <= 0) {
//                     currentDate = tempDate;
//                   }
//                 });
//               } else if (widget.pickerDateComponent ==
//                   PickerDateComponent.year) {
//                 DateTime tempDate = DateTime(
//                     currentDate.year + 1, currentDate.month, currentDate.day);
//                 setState(() {
//                   currentDate = tempDate;
//                   if (tempDate.compareTo(lastValue!) <= 0) {
//                     currentDate = tempDate;
//                   }
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
