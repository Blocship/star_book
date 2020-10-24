/// Checks if the given date is equal to the current date.
bool isCurrentDate(DateTime date) {
  final DateTime now = DateTime.now();
  return date.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
}

/// Gets the number of days for the given month.
///
/// By taking the next month on day 0 and getting the number of days.
/// DateTime.monthsPerYear = 12
/// DateTime(year, month + 1, 0).day => Last day of month => 1 is first dat,
/// 0 means previous day.
int getDaysInMonth(int year, int month) {
  return month < DateTime.monthsPerYear
      ? DateTime(year, month + 1, 0).day
      : DateTime(year + 1, 1, 0).day;
}

/// Returns the next month,
/// For December it will return January
int getNextMonth(int month, int year) {
  return (month == 12) ? month = 1 : month + 1;
}

/// Returns the next year,
/// For December it will return next year, else same year
int getNextYear(int month, int year) {
  return (month == 12) ? year + 1 : year;
}

/// Returns the previous month,
/// For January it will return December
int getPreviousMonth(int month, int year) {
  return (month == 1) ? month = 12 : month - 1;
}

/// Returns the previous year,
/// For January it will return previous year, else same year
int getPreviousYear(int month, int year) {
  return (month == 1) ? year - 1 : year;
}

/// List of months name
const List<String> _monthList = const <String>[
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
  return _monthList[month - 1];
}
