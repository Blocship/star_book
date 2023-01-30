import 'package:flutter/material.dart';
import 'package:star_book/widgets/calendar/month_view.dart';

class YearView extends StatelessWidget {
  const YearView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year.toInt();
    final List<int> pastYears = [];
    for (int i = 0; i < 5; i++) {
      pastYears.add(currentYear);
      currentYear--;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        itemCount: pastYears.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(pastYears[index].toString()),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.32,
                child: const MonthTile(),
              ),
            ],
            // ),
          );
        },
      ),
    );
  }
}
