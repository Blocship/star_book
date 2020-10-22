class Id {
  Id(this.day, this.month, this.year);
  final int day;
  final int month;
  final int year;

  /// formate 'dd-mm-yyyy'
  Id.from(String s)
      : this.day = int.parse(s.split('-')[0]),
        this.month = int.parse(s.split('-')[1]),
        this.year = int.parse(s.split('-')[2]);

  @override
  bool operator ==(o) =>
      o is Id && o.day == day && o.month == month && o.year == year;

  @override
  int get hashCode => day.hashCode + month.hashCode + year.hashCode;

  @override
  String toString() {
    return "$day-$month-$year";
  }
}
