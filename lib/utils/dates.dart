/// Checks if the given date is today.
bool isToday(DateTime date) {
  final DateTime now = DateTime.now();
  return date.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
}

/// Gets the number of days for the given month,
/// by taking the next month on day 0 and getting the number of days.
int getNumberOfDaysInMonth(int year, int month) {
  return month < DateTime.monthsPerYear
      ? DateTime(year, month + 1, 0).day
      : DateTime(year + 1, 1, 0).day;
}

/// Gets the name of the given month by its number,
/// using either the default name or custom names when supplied.
String getMonthName(int month, {List<String> customNames}) {
  final List<String> monthNames = customNames ??
      [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ];
  return monthNames[month - 1];
}
