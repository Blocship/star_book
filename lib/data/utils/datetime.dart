extension XDateTime on DateTime {
  DateTime get startTimeofDay {
    return DateTime(year, month, day);
  }

  DateTime get endTimeofDay {
    return DateTime(year, month, day, 23, 59, 59, 999, 499);
  }
}
