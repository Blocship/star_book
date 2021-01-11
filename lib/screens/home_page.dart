import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:swipedetector/swipedetector.dart';
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

  // void onHorizontalDragEnd(c.DragUpdateDetails value) {
  //   (value.primaryDelta.isNegative)
  //       ?
  //       // Drags Left
  //       setState(() {
  //           year = getNextYear(month, year);
  //           month = getNextMonth(month, year);
  //         })
  //       :
  //       // Drags Right
  //       setState(() {
  //           year = getPreviousYear(month, year);
  //           month = getPreviousMonth(month, year);
  //         });
  // }

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
        trailing: PreferanceButton(),
        border: null,
      ),
      child: c.Container(
        child: c.SafeArea(
                child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c.BuildContext context, int index) {
                return c.Dismissible(
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
                    }
                     else if (direction == c.DismissDirection.startToEnd) {
                      setState(() {
                        year = getPreviousYear(month, year);
                        month = getPreviousMonth(month, year);
                      });
                    }
                  },
                );
              }),
        ),
      ),
      // child: c.SafeArea(
      //         child: c.Container(
      //     ////height: 400,
      //     ////width: double.infinity,
      //     ////padding: c.EdgeInsets.symmetric(horizontal: 12),
      //     child: SwipeDetector(
      //       onSwipeLeft: () {
      //         print("Next year");
      //         setState(() {
      //           year = getNextYear(month, year);
      //           month = getNextMonth(month, year);
      //         });
      //       },
      //       onSwipeRight: () {
      //         print("Prev year");
      //         setState(() {
      //           year = getPreviousYear(month, year);
      //           month = getPreviousMonth(month, year);
      //         });
      //       },
      //       child: Month(
      //         month: month,
      //         year: year,
      //       ),
      //     ),
      //   ),
      // ),
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
