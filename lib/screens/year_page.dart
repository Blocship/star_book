import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../widgets/year.dart';

class YearPage extends StatefulWidget {
  YearPage({
  @required this.startYear,
  @required this.endYear
  });
  final DateTime startYear;
  final DateTime endYear;
  @override
  _YearPageState createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  @override
  Widget build(BuildContext context) {
    final int _itemCount = widget.endYear.year - widget.startYear.year + 1;
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemBackground,
        context,
      ),
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemBackground,
          context,
        ),
        border: null,
      ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: c.ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 2.5 , vertical: 2.5),
          scrollDirection: Axis.vertical,
          reverse: true,
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            return Year(year: widget.endYear.year - index);
          },
        ),
      ),
    );
  }
}
