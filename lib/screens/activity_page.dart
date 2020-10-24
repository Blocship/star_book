import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';
import '../models/mood.dart';
import '../styles/style.dart';

// TODO: display activity in cupertino style,
// added just to implement route,
// will complete it later.
/// Activity Page Screen widget displays [Activity]
class ActivityPage extends StatelessWidget {
  // TODO: moodID and color id is same, this may break change later,
  // will get the mood from list on the basis of moodId.
  ActivityPage(this.activity) : mood = mMoodList[activity.moodId];

  final Mood mood;
  final Activity activity;

  void onEdit(BuildContext context) {
    Navigator.of(context).popAndPushNamed("/edit", arguments: activity);
  }

  Widget _buildNavBar(BuildContext context) {
    return c.CupertinoNavigationBar(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.tertiarySystemBackground, context),
      middle: Text('Activity'),
      trailing: GestureDetector(
        onTap: () => onEdit(context),
        child: Text(
          "Edit",
          style: c.CupertinoTheme.of(context).textTheme.navActionTextStyle,
        ),
      ),
      border: null,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: c.CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${activity.day} - ${activity.month} - ${activity.year}",
                    style: Style.bodySecondary(context),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                mood.label,
                style: Style.body(context),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                activity.title,
                style: Style.largeTitle(context),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                activity.note,
                style: Style.body(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.tertiarySystemBackground,
        context,
      ),
      navigationBar: _buildNavBar(context),
      child: _buildBody(context),
    );
  }
}
