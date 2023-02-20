// create a freezed class
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day.freezed.dart';

@freezed
class Day with _$Day {
  const Day._();

  @Assert('year >= 0')
  @Assert('month >= 1 && month <= 12')
  @Assert('day >= 1 && day <= 31')
  const factory Day({
    required int year,
    required int month,
    required int day,
  }) = _Day;

  factory Day.fromDateTime(DateTime dateTime) => Day(
        year: dateTime.year,
        month: dateTime.month,
        day: dateTime.day,
      );

  DateTime toDateTime() => DateTime(year, month, day);

  // factory Day.fromDayKey(String dayKey) {
  //   final parts = dayKey.split('-');
  //   return Day(
  //     year: int.parse(parts[0]),
  //     month: int.parse(parts[1]),
  //     day: int.parse(parts[2]),
  //   );
  // }

  // String get dayKey => '$year-$month-$day';

}

extension XDateTime on DateTime {
  // String get dayKey => '$year-$month-$day';

  // DateTime fromDayKey(String dayKey) {
  //   final parts = dayKey.split('-');
  //   return DateTime(
  //     int.parse(parts[0]),
  //     int.parse(parts[1]),
  //     int.parse(parts[2]),
  //   );
  // }

  Day get toDay => Day(
        year: year,
        month: month,
        day: day,
      );
}
