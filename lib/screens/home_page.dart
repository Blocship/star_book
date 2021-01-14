import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import '../api/unsplash_api_service.dart';
import '../models/unsplash_photo.dart';
import '../utils/date.dart';
import '../widgets/month.dart';
import './profile_page.dart';

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
  List<UnsplashPhoto> images = List<UnsplashPhoto>();
  bool _loading = false;

  // TODO: fetch data from database based.
  // using mock data for now
  // final List<Mood> moodList = new List<Mood>.from(mMoodList);

  // List photoList;
  @override
  void initState() {
    month = DateTime.now().month;
    year = DateTime.now().year;
    initImages();

    super.initState();
  }

  void initImages() async {
    images = await UnsplashAPIService.getPhotos(12);
    print(images);
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
        color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemBackground,
          context,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('backup-bg-image.JPG'),
        ),
      ),
      child: c.CupertinoPageScaffold(
        backgroundColor: Color(0x00000000),
        navigationBar: c.CupertinoNavigationBar(
          backgroundColor: Color(0x00000000),
          leading: PreferanceButton(),
          trailing: YearButton(),
          border: null,
        ),
        child: SafeArea(
          child: c.GestureDetector(
            onHorizontalDragEnd: onHorizontalDragEnd,
            child: Container(
              padding: c.EdgeInsets.symmetric(horizontal: 12),
              child: c.Column(
                children: [
                  Month(
                    month: month,
                    year: year,
                  ),
                  c.CupertinoButton(
                    child: Text('Profile Page'),
                    onPressed: () {
                      Navigator.push(context , c.CupertinoPageRoute(builder: (context) => ProfilePage()));
                    },
                  )
                ],
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
