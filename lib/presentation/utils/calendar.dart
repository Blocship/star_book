class CalendarUtils {
  /// This function check whether the given date is equal to the current date or not
  static bool isCurrentDate(DateTime dateTime) {
    final DateTime now = DateTime.now();
    return dateTime.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
  }

  /// This function returns the number of days in given month
  static int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  ///This function returns month Name (like; month = 1 => January)
  static String getMonthName(int month) {
    final List<String> monthName = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return monthName[month - 1];
  }

  static String getFullMonthName(int month) {
    final List<String> monthName = [
      'January',
      'February',
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
    return monthName[month - 1];
  }
// static Color getDayNumberColor(DateTime date) {
//   Color color = Colors.transparent;
//   if (Dates.isCurrentDate(date)) {
//     color = Colors.blue;
//   }
//   return color;
// }
}
