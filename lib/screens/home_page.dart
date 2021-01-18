import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../widgets/month.dart';
<<<<<<< HEAD
import '../models/mood.dart';
import '../utils/date.dart';
=======
import './profile_page.dart';

enum BottomTabOption {
  home,
  profile,
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomTabOption selectedTab;

  @override
  void initState() {
    selectedTab = BottomTabOption.home;
    super.initState();
  }

  void changeTab(int index) {
    setState(() {
      selectedTab = BottomTabOption.values[index];
    });
  }

  Widget tabBuilder(BuildContext context, int index) {
    if (BottomTabOption.values[index] == BottomTabOption.home) {
      return HomePage();
    } else {
      return ProfilePage();
    }
  }

  final List<BottomNavigationBarItem> bottomTabItems = [
    BottomNavigationBarItem(
      icon: Icon(c.CupertinoIcons.house_fill),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(c.CupertinoIcons.person_crop_circle_fill),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return c.CupertinoTabScaffold(
      backgroundColor: Color(0x00000000),
      tabBar: c.CupertinoTabBar(
        backgroundColor: Color(0x00000000),
        border: null,
        onTap: changeTab,
        currentIndex: selectedTab.index,
        items: bottomTabItems,
      ),
      tabBuilder: tabBuilder,
    );
  }
}
>>>>>>> upstream/master

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

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemBackground,
        context,
      ),
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoDynamicColor.resolve(
=======
    return Container(
      decoration: BoxDecoration(
        color: c.CupertinoDynamicColor.resolve(
>>>>>>> upstream/master
          c.CupertinoColors.systemBackground,
          context,
        ),
        trailing: PreferanceButton(),
        border: null,
      ),
      child: c.Container(
        height: double.maxFinite,
        child: c.ListView.builder(
          itemCount: 1,
          itemBuilder: (c.BuildContext context, int index) {
            return c.Container(
              child: c.Dismissible(
                key: c.UniqueKey(),
                child: Month(
                  month: month,
                  year: year,
                ),
                onDismissed: (direction) {
                  if (direction == c.DismissDirection.endToStart) {
                    setState(() {
                      year = getNextYear(month, year);
                      month = getNextMonth(month, year);
                    });
                  } else if (direction == c.DismissDirection.startToEnd) {
                    setState(() {
                      year = getPreviousYear(month, year);
                      month = getPreviousMonth(month, year);
                    });
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class PreferanceButton extends StatelessWidget {
  void onTap(context) {
    Navigator.of(context).pushNamed("/preferance");
  }

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
<<<<<<< HEAD
=======

class YearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pushNamed('/year');
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
>>>>>>> upstream/master
