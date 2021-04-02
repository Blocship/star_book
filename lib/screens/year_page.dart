import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../widgets/year.dart';

/// Year Page Widget displays calender for current year and past 4 years and dates are colored with [Mood] color.
class YearPage extends StatefulWidget {
  @override
  _YearPageState createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemBackground,
        context,
      ),
      navigationBar: c.CupertinoNavigationBar(
        heroTag: 'YearPage',
        transitionBetweenRoutes: false,
        backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemBackground,
          context,
        ),
        middle: Text('Year'),
        previousPageTitle: 'Home',
        border: null,
      ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          reverse: true,
          itemBuilder: (context, index) {
            return Year(year: currentYear - index);
          },
        ),
      ),
    );
  }
}
