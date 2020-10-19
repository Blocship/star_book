import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
// Files
import '../routes/route_generator.dart';
import '../widgets/action_container.dart';
import '../models/activity.dart';
import '../widgets/my_container.dart';

class ActivityEditSheetRouteInitializer extends StatelessWidget {
  ActivityEditSheetRouteInitializer(this.activity);

  final Activity activity;

  Future<bool> _handlePopScope(BuildContext context) async {
    bool shouldClose = false;
    await c.showCupertinoModalPopup(
      context: context,
      builder: (context) => c.CupertinoActionSheet(
        actions: [
          c.CupertinoActionSheetAction(
            onPressed: () {
              shouldClose = true;
              Navigator.of(context).pop();
            },
            child: Text("Discard Changes"),
            isDestructiveAction: true,
          ),
        ],
        cancelButton: c.CupertinoActionSheetAction(
          onPressed: () {
            shouldClose = false;
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
      ),
    );
    return shouldClose;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handlePopScope(context),
      child: Navigator(
        initialRoute: 'edit/title',
        onGenerateRoute: (settings) =>
            RouteGenerator.activityRoute(settings, activity),
      ),
    );
  }
}

class ActivityEditSheet extends c.StatefulWidget {
  ActivityEditSheet(this.activity);

  final Activity activity;

  @override
  _ActivityEditSheetState createState() => _ActivityEditSheetState();
}

class _ActivityEditSheetState extends c.State<ActivityEditSheet> {
  Activity activity;
  @override
  void initState() {
    super.initState();
    // TODO: Shallow clone to deep clone
    activity = widget.activity;
    titleController.addListener(onTitleChange);
    noteController.addListener(onNoteChange);
  }

  final titleController = TextEditingController();
  final noteController = TextEditingController();

  void onTitleChange() {
    this.activity.title = titleController.text;
  }

  void onNoteChange() {
    this.activity.note = noteController.text;
  }

  Widget _buildNavBar() {
    return c.CupertinoNavigationBar(
      leading: Container(),
      middle: Text("Add/Edit"),
      trailing: GestureDetector(
        onTap: () {
          if (activity.title != null &&
              activity.note != null &&
              activity.moodId != null) {
            Hive.box<Activity>(activityBoxName).add(activity);
            Navigator.of(context, rootNavigator: true).pop();
          }
        },
        child: Text("Done"),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return c.SingleChildScrollView(
      child: SafeArea(
        // minimum: EdgeInsets.symmetric(horizontal: 16),
        child: c.Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            MyContainer(
              child: c.Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date"),
                  Text(
                      "${activity.day.toString()} / ${activity.month.toString()} / ${activity.year.toString()}"),
                ],
              ),
              onTap: null,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            ActionContainer(
              text: "Mood",
              icon: c.CupertinoIcons.right_chevron,
              onTap: () async {
                dynamic moodId =
                    await Navigator.of(context).pushNamed("edit/mood");
                activity.moodId = moodId;
              },
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            MyContainer(
              child: c.CupertinoTextField(
                controller: titleController,
                placeholder: "Title",
                decoration: null,
                maxLines: 1,
                onTap: null,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            MyContainer(
              child: c.CupertinoTextField(
                controller: noteController,
                placeholder: "Note",
                decoration: null,
                maxLines: null,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                onTap: null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(activity.day);
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoColors.systemGroupedBackground,
      navigationBar: _buildNavBar(),
      child: _buildBody(context),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
