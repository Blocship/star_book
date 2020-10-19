import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
// Files
import '../widgets/month.dart';
import '../models/activity.dart';
import '../models/mood.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int month;
  int year;
  List<Activity> activityList;

  // TODO: fetch data from database based.
  // using mock data for now
  final List<Mood> moodList = new List<Mood>.from(mMoodList);

  @override
  void initState() {
    print(Hive.box<Activity>(activityBoxName).length);
    month = DateTime.now().month;
    year = DateTime.now().year;
    activityList = _setActivityList(month: month, year: year);
    super.initState();
  }

  List<Activity> _setActivityList({int month, int year}) {
    return Hive.box<Activity>(activityBoxName)
        .values
        .toList()
        .where(
          (element) => (element.month == month && element.year == year),
        )
        .toList();
  }

  void onHorizontalDragEnd(c.DragEndDetails value) {
    // Drags Left
    if (value.primaryVelocity.isNegative) {
      if (month == 12) {
        month = 1;
        year++;
      } else {
        month++;
      }

      setState(() {
        activityList = _setActivityList(month: month, year: year);
      });
    }
    // Drags Right
    else if (!value.primaryVelocity.isNegative) {
      if (month == 1) {
        month = 12;
        year--;
      } else {
        month--;
      }

      setState(() {
        activityList = _setActivityList(month: month, year: year);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(activityList.length);
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoColors.systemBackground,
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoColors.systemBackground,
        trailing: PreferanceButton(),
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
              activityList: activityList,
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
