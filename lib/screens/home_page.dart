import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../widgets/month.dart';
import '../models/mood.dart';
import '../utils/date.dart';
import '../APIService/APIService.dart';

/// Home Page Screen widget is the main page
/// of the app that renders [Month] and [PreferanceButton] widgets
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List photoList;
  int index = 0;
  int month;
  int year;

  // TODO: fetch data from database based.
  // using mock data for now
  final List<Mood> moodList = new List<Mood>.from(mMoodList);

  @override
  void initState() {
    month = DateTime.now().month;
    year = DateTime.now().year;
    requestImages();
    super.initState();
  }

  void requestImages() async {//this function the getImages() of APIService that makes a get request to Unsplash API
    APIService api = APIService();
    List response = await api.getImages();
    setState(() {
      photoList = response;
    });
  }

  void onHorizontalDragEnd(c.DragEndDetails value) {
    (value.primaryVelocity.isNegative)
        ?
        // Drags Left
        setState(() {
            year = getNextYear(month, year);
            month = getNextMonth(month, year);
            //to change background on swipe
            index < photoList.length - 1 ? index += 1 : index = 0;
          })
        :
        // Drags Right
        setState(() {
            year = getPreviousYear(month, year);
            month = getPreviousMonth(month, year);
            //to change background on swipe
            index > 0 ? index -= 1 : index = photoList.length - 1;
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
        trailing: PreferanceButton(),
        border: null,
      ),
      child: photoList == null
          ? Center(child: c.CupertinoActivityIndicator())
          : SafeArea(
              child: c.GestureDetector(
                onHorizontalDragEnd: onHorizontalDragEnd,
                child: c.Container(
                  height: c.MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: c.NetworkImage(
                              photoList[index]['urls']['regular']))),
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
