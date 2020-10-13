import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../screens/preferance_sheet.dart';
import '../utils/bottom_sheet.dart';
import '../widgets/month.dart';
import '../styles/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int month;
  int year;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    month = 10;
    year = 2020;
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoColors.systemBackground,
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoColors.systemBackground,
        trailing: PreferanceButton(),
        border: null,
      ),
      child: SafeArea(
        child: c.GestureDetector(
          onHorizontalDragEnd: (value) {
            // Drags Left
            if (value.primaryVelocity.isNegative) {
              if (month == 12) {
                month = 1;
                year++;
              } else {
                month++;
              }
              setState(() {});
            }
            // Drags Right
            else if (!value.primaryVelocity.isNegative) {
              if (month == 1) {
                month = 12;
                year--;
              } else {
                month--;
              }
              setState(() {});
            }
          },
          child: c.Container(
            padding: c.EdgeInsets.symmetric(horizontal: 12),
            child: Month(month: month, year: year),
          ),
        ),
      ),
    );
  }
}

class PreferanceButton extends StatelessWidget {
  final Function onTap = (context) {
    bottomSheet(context: context, child: PreferanceSheet());
    return null;
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Icon(
        CupertinoIcons.preferanceIcon,
        color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.label,
          context,
        ),
      ),
    );
  }
}
