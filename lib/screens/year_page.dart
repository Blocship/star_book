import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../widgets/year.dart';

class YearPage extends StatefulWidget {
  @override
  _YearPageState createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  @override
  Widget build(BuildContext context) {
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
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Year(year: 2021 + index);
          },
        ),
      ),
    );
  }
}
