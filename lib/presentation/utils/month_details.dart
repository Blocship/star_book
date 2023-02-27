class MonthDetails {
  final int year;
  final int month;
  final bool isHomeScreen;

  MonthDetails(
      {required this.year, required this.month, required this.isHomeScreen});
}

class DateTimeDetails {
  final int day;
  final int year;
  final int month;

  DateTimeDetails({required this.day, required this.year, required this.month});
}
