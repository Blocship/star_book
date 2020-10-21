/// Checks if the given date is equal to the current date.
bool isCurrentDate(DateTime date) {
  final DateTime now = DateTime.now();
  return date.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
}

/// Gets the number of days for the given month,
/// by taking the next month on day 0 and getting the number of days.
/// DateTime.monthsPerYear = 12
/// DateTime(year, month + 1, 0).day => Last day of month => 1 is first dat, 0 means previous day.
int getDaysInMonth(int year, int month) {
  return month < DateTime.monthsPerYear
      ? DateTime(year, month + 1, 0).day
      : DateTime(year + 1, 1, 0).day;
}

int getNextMonth(int year, int month) {
  return (month == 12) ? month = 1 : month + 1;
}

int getNextYear(int year, int month) {
  return (month == 12) ? year + 1 : year;
}

int getPreviousMonth(int year, int month) {
  return (month == 1) ? month = 12 : month - 1;
}

int getPreviousYear(int year, int month) {
  return (month == 1) ? year - 1 : year;
}

/// List of months name
const List<String> monthList = <String>[
  'January',
  'Feburary',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

/// Gets the name of the given month by its number,
String getMonthTitle(int month) {
  return monthList[month - 1];
}
