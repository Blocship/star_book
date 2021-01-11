import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../utils/date.dart';
import '../widgets/Unsplash_Image.dart';
import '../widgets/month.dart';

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
  UnsplashImage m = UnsplashImage();

  // TODO: fetch data from database based.
  // using mock data for now
  // final List<Mood> moodList = new List<Mood>.from(mMoodList);

  // List photoList;
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
            index < 28 ? index += 1 : index = 0;
          })
        :
        // Drags Right
        setState(() {
            year = getPreviousYear(month, year);
            month = getPreviousMonth(month, year);
            index > 0 ? index -= 1 : index = 28;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: m.getBackgroundImage(index),
        ),
      ),
      child: c.CupertinoPageScaffold(
        backgroundColor: Color(0x00000000),
        navigationBar: c.CupertinoNavigationBar(
          backgroundColor: Color(0x00000000),
          trailing: PreferanceButton(),
          leading: m.getAttribution(index, context),
        ),
        child: SafeArea(
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
