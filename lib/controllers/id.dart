/// Takes the Intergers day, month and year
/// to convert to and from String
/// I don't know why I did this, I could have make function for this,
/// pun intended
class Id {
  Id(this.day, this.month, this.year);
  final int day;
  final int month;
  final int year;

  /// Input formate `dd-mm-yyyy`
  Id.from(String s)
      : this.day = int.parse(s.split('-')[0]),
        this.month = int.parse(s.split('-')[1]),
        this.year = int.parse(s.split('-')[2]);

  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  @override
  bool operator ==(o) =>
      o is Id && o.day == day && o.month == month && o.year == year;

  @override
  int get hashCode => day.hashCode + month.hashCode + year.hashCode;

  /// Returns String in `dd-mm-yyyy` form
  @override
  String toString() {
    return "$day-$month-$year";
  }
}
