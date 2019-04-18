/// Check whether the 2 given dates are the same
bool onTheSameDate(DateTime date1, DateTime date2) {
  return (date1.year == date2.year) &&
      (date1.month == date2.month) &&
      (date1.day == date2.day);
}

/// Get the amount of days in the given month (by taking the
/// next month on day 0 and getting the number of days)
int getNumberOfDaysInMonth(int year, int month) {
  if (month < 12) {
    return DateTime(year, month + 1, 0).day;
  } else {
    // month = 12
    return DateTime(year + 1, 1, 0).day;
  }
}

/// Get the name of a given month, by either using
/// the default name or the custom ones when supplied
String getMonthName(int month, {List<String> customNames}) {
  final List<String> monthNames = (customNames == null)
      ? [
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
        ]
      : customNames;
  return monthNames[month - 1];
}
