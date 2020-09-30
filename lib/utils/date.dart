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
