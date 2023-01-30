class Dates {
  /// This function check whether the given date is equal to the current date or not
  static bool isCurrentDate(DateTime dateTime) {
    final DateTime now = DateTime.now();
    return dateTime.isAtSameMomentAs(DateTime(now.year, now.month, now.day));
  }

  /// This function returns the number of days in given month
  static int getDaysInMonth(int year, int month) {
    return month < DateTime.monthsPerYear
        ? DateTime(year, month + 1, 0).day
        : DateTime(year + 1, 1, 0).day;
  }

  ///This function returns month Name (like; month = 1 => January)
  static  String getMonthName(int month) {
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
}
