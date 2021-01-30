import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Files
import '../models/activity.dart';
import '../models/mood.dart';
import '../styles/style.dart';
import '../utils/date.dart';
import '../utils/share.dart';

/// Activity Page Screen widget displays [Activity]
class ActivityPage extends StatelessWidget {
  // TODO: moodID and color id is same, this may break change later,
  // will get the mood from list on the basis of moodId.
  ActivityPage(this.activity) : mood = mMoodList[activity.moodId];

  final Activity activity;
  final Mood mood;
  GlobalKey globalKey = GlobalKey();

  void onEdit(BuildContext context) async {
    await Navigator.of(context).popAndPushNamed("/edit", arguments: activity);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) => c.RepaintBoundary(
        key: globalKey,
        child: c.CupertinoPageScaffold(
          backgroundColor: c.CupertinoDynamicColor.resolve(
            c.CupertinoColors.tertiarySystemBackground,
            context,
          ),
          navigationBar: c.CupertinoNavigationBar(
            backgroundColor: c.CupertinoDynamicColor.resolve(
                c.CupertinoColors.tertiarySystemBackground, context),
            middle: Text('Activity'),
            trailing: GestureDetector(
              onTap: () => onEdit(context),
              child: Text(
                "Edit",
                style:
                    c.CupertinoTheme.of(context).textTheme.navActionTextStyle,
              ),
            ),
            border: null,
          ),
          child: SingleChildScrollView(
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
                          "${getMonthTitle(activity.month)} ${activity.day}, ${activity.year}",
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
                    child: SelectableText(activity.title,
                        showCursor: true,
                        toolbarOptions:
                            c.ToolbarOptions(copy: true, selectAll: true),
                        style: Style.largeTitle(context),
                        enableInteractiveSelection: true),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: SelectableText(
                      activity.note,
                      showCursor: true,
                      toolbarOptions:
                          c.ToolbarOptions(copy: true, selectAll: true),
                      style: Style.body(context),
                      enableInteractiveSelection: true,
                    ),
                  ),
                  c.Center(
                    child: c.Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: c.CupertinoButton(
                        onPressed: () =>
                            {convertWidgetToImageAndShare(ctx, globalKey)},
                        color: Colors.blue,
                        borderRadius: new BorderRadius.circular(10.0),
                        child: c.Row(
                          mainAxisAlignment: c.MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            c.SizedBox(
                              width: 20,
                            ),
                            new Text(
                              "Share",
                              textAlign: TextAlign.center,
                              style: new TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
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
