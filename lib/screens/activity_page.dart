import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';
import '../models/mood.dart';

// TODO: display activity in cupertino style,
// added just to implement route,
// will complete it later.
class ActivityPage extends StatelessWidget {
  // TODO: moodID and color id is same, this may break change later,
  // will get the mood from list on the basis of moodId.
  ActivityPage(this.activity) : mood = mMoodList[activity.moodId];

  final Mood mood;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      navigationBar: c.CupertinoNavigationBar(
        middle: Text('Activity'),
        trailing: c.GestureDetector(
          onTap: () {},
          child: Text(
            "Edit",
            style: c.CupertinoTheme.of(context).textTheme.navActionTextStyle,
          ),
        ),
      ),
      child: c.SingleChildScrollView(
        child: SafeArea(
          child: c.Column(
            crossAxisAlignment: c.CrossAxisAlignment.start,
            children: [
              c.Container(
                padding: c.EdgeInsets.all(16),
                child: c.Row(
                  mainAxisAlignment: c.MainAxisAlignment.center,
                  children: [
                    c.Text(
                      "${activity.day} - ${activity.month} - ${activity.year}",
                      style: c.TextStyle(
                          fontWeight: c.FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              c.Container(
                padding: c.EdgeInsets.all(16),
                child: c.Text(mood.label),
              ),
              c.Container(
                padding: c.EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: c.Text(
                  activity.title,
                  style: c.CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle,
                ),
              ),
              c.Container(
                padding: c.EdgeInsets.all(16),
                child: c.Text(activity.note),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
