import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../widgets/month.dart';
import '../models/mood.dart';
import '../utils/date.dart';

/// Home Page Screen widget is the main page
/// of the app that renders [Month] and [PreferanceButton] widgets
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int month;
  int year;

  // TODO: fetch data from database based.
  // using mock data for now
  final List<Mood> moodList = new List<Mood>.from(mMoodList);

  @override
  void initState() {
    month = DateTime.now().month;
    year = DateTime.now().year;
    super.initState();
  }

  void onHorizontalDragEnd(c.DragEndDetails value) {
    (value.primaryVelocity.isNegative)
        ?
        // Drags Left
        setState(() {
            year = getNextYear(month, year);
            month = getNextMonth(month, year);
          })
        :
        // Drags Right
        setState(() {
            year = getPreviousYear(month, year);
            month = getPreviousMonth(month, year);
          });
  }

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
        leading: PreferanceButton(),
        trailing: YearButton(),
        border: null,
      ),
      child: SafeArea(
        child: c.GestureDetector(
          onHorizontalDragEnd: onHorizontalDragEnd,
          child: c.Container(
            padding: c.EdgeInsets.symmetric(horizontal: 12),
            child: Month(
              month: month,
              year: year,
            ),
          ),
        ),
      ),
    );
  }
}

class PreferanceButton extends StatelessWidget {
  final Function onTap = (context) {
    Navigator.of(context).pushNamed("/preferance");
    return null;
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Icon(
        c.CupertinoIcons.bars,
        color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.label,
          context,
        ),
      ),
    );
  }
}

class YearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).pushNamed('/year');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsetsDirectional.only(start: 8.0)),
          Text('Year'),
          const Padding(padding: EdgeInsetsDirectional.only(start: 6.0)),
        ],
      ),
    );
  }
}
