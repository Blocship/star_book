import 'package:flutter/material.dart';
import 'package:star_book/presentation/utils/calendar.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  int month = DateTime.now().month;
  int date = DateTime.now().day;
  int year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    if (date > CalendarUtils.getDaysInMonth(year, month)) {
      if (month < 12) {
        month++;
      } else {
        month = 1;
        year++;
      }

      date = 1;
    }
    if (date < 1) {
      if (month > 1) {
        month--;
      } else {
        month = 12;
        year--;
      }
      date = CalendarUtils.getDaysInMonth(year, month);
    }
    // if (month < 12) {
    //   month++;
    // } else {
    //   month = 1;
    //   year++;
    // }
    //
    // if (month > 1) {
    //   month--;
    // } else {
    //   month = 12;
    //   year--;
    // }

    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// Month Column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          month++;
                          if (month > 12) {
                            month = month - 12;
                            year++;
                          }
                          // if (date >
                          //     CalendarUtils.getDaysInMonth(year, month)) {
                          //   date =
                          //       CalendarUtils.getDaysInMonth(year, month + 1);
                          // }
                        });
                      }),
                  const SizedBox(height: 10),
                  Text(
                    CalendarUtils.getMonthName(month),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const Text('Month', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          month--;
                          if (month <= 0) {
                            month = month + 12;
                            year--;
                          }
                        });
                      }),
                ],
              ),

              ///Date Column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          date++;
                        });
                      }),
                  const SizedBox(height: 10),
                  Text(
                    date.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const Text('Date', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          date--;
                        });
                      }),
                ],
              ),

              ///Year Column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          year++;
                        });
                      }),
                  const SizedBox(height: 10),
                  Text(
                    year.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const Text('Date', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          year--;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
