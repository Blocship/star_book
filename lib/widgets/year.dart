import 'package:flutter/widgets.dart';

// Files
import './month.dart';
import '../styles/style.dart';

class Year extends StatefulWidget {
  final int year;
  Year({@required this.year});

  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  List<Month> months = List<Month>();
  @override
  void initState() {
    for (int i = 1; i <= 12; i++) {
      months.add(Month(
        month: i,
        year: widget.year,
        onPressed: true,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(14, 10, 0, 10),
          child: Text(
            '${widget.year}',
            style: Style.largeTitle(context),
          ),
          alignment: Alignment.centerLeft,
        ),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          crossAxisSpacing: 8,
          childAspectRatio: 0.8,
          crossAxisCount: 3,
          children: months,
        ),
      ],
    );
  }
}
