/// Checks whether two given dates are the same.
bool isSameDate(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

/// Gets the number of days for the given month,
/// by taking the next month on day 0 and getting the number of days.
int getNumberOfDaysInMonth(int year, int month) {
  if (month < 12) {
    return DateTime(year, month + 1, 0).day;
  } else {
    return DateTime(year + 1, 1, 0).day;
  }
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
