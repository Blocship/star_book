import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:star_book/screens/activity_edit_sheet.dart';

// Files
import '../models/activity.dart';
import '../models/mood.dart';
import '../styles/style.dart';

/// Activity Page Screen widget displays [Activity]
class ActivityPage extends StatelessWidget {
  // TODO: moodID and color id is same, this may break change later,
  // will get the mood from list on the basis of moodId.
  static const String route = '/activity';
  ActivityPage(this.activity) : mood = mMoodList[activity.moodId!];

  final Mood mood;
  final Activity activity;

  void onEdit(BuildContext context) async {
    await Navigator.of(context).popAndPushNamed(ActivityRouteInitializer.route, arguments: activity);
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.tertiarySystemBackground,
        context,
      ),
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.tertiarySystemBackground,
          context,
        ),
        middle: const Text('Activity'),
        trailing: GestureDetector(
          onTap: () => onEdit(context),
          child: const c.Icon(Icons.more_horiz_rounded),
        ),
        border: null,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: c.CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${activity.dateFormat()}',
                      style: Style.bodySecondary(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  mood.label,
                  style: Style.body(context),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: SelectableText(
                  activity.title!,
                  showCursor: true,
                  toolbarOptions: c.ToolbarOptions(copy: true, selectAll: true),
                  style: Style.largeTitle(context),
                  enableInteractiveSelection: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: SelectableText(
                  activity.note!,
                  showCursor: true,
                  toolbarOptions: c.ToolbarOptions(copy: true, selectAll: true),
                  style: Style.body(context),
                  enableInteractiveSelection: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
