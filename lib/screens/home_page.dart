import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as c;

// Files
import './profile_page.dart';
import '../utils/date.dart';
import '../widgets/background_images.dart';
import '../widgets/month.dart';

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

/// Home Page Screen widget is the main page
/// of the app that renders [Month] and [PreferanceButton] widgets
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int month;
  int year;
  int index = 0;
  bool _loading = false;
  // TODO: fetch data from database based.
  // using mock data for now
  // final List<Mood> moodList = new List<Mood>.from(mMoodList);

  // List photoList;
  @override
  void initState() {
    super.initState();
    month = DateTime.now().month;
    year = DateTime.now().year;
  }

  void onHorizontalDragEnd(c.DragEndDetails value) {
    if (value.primaryVelocity.isNegative) {
      // Drags Left
      setState(() {
        year = getNextYear(month, year);
        month = getNextMonth(month, year);
        index < 28 ? index += 1 : index = 0;
      });
    } else if (value.primaryVelocity > 0) {
      // Drags Right
      setState(() {
        year = getPreviousYear(month, year);
        month = getPreviousMonth(month, year);
        index > 0 ? index -= 1 : index = 28;
      });
    }
    // else velocity is zero, no need to do anything
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: c.CupertinoDynamicColor.resolve(
            c.CupertinoColors.systemBackground,
            context,
          ),
        ),
        BackgroundImage(month: month),
        c.CupertinoPageScaffold(
          backgroundColor: Color(0x00000000),
          navigationBar: c.CupertinoNavigationBar(
            heroTag: 'HomePage',
            transitionBetweenRoutes: false,
            backgroundColor: Color(0x00000000),
            trailing: YearButton(),
            border: null,
            automaticallyImplyLeading: false,
          ),
          child: SafeArea(
            child: Container(
              child: c.GestureDetector(
                onHorizontalDragEnd: onHorizontalDragEnd,
                child: Container(
                  padding: c.EdgeInsets.symmetric(horizontal: 12),
                  child: Month(
                    month: month,
                    year: year,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class YearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pushNamed('year');
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
