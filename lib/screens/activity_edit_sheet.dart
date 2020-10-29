import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../routes/route_generator.dart';
import '../models/activity.dart';
import '../widgets/my_container.dart';
import '../controllers/activity.dart';
import '../styles/style.dart';
import '../utils/color.dart';
import '../widgets/color_container.dart';

/// Activity Add and Edit Sheet Screen widget.
///
/// Input form to create update and delete [Activity]
class ActivityEditSheet extends StatefulWidget {
  ActivityEditSheet(this.activity);
  final Activity activity;

  @override
  _ActivityEditSheetState createState() => _ActivityEditSheetState();
}

class _ActivityEditSheetState extends State<ActivityEditSheet> {
  Activity activity;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    activity = Activity.from(widget.activity);
    titleController.text = activity.title;
    noteController.text = activity.note;
    titleController.addListener(onTitleChange);
    noteController.addListener(onNoteChange);
  }

  void onTitleChange() {
    this.activity.title = titleController.text;
  }

  void onNoteChange() {
    this.activity.note = noteController.text;
  }

  void onDone(BuildContext context) async {
    if (activity.isFilled()) {
      ActivityController.update(activity);
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  // c.CupertinoDynamicColor _getButtonColor(c.BuildContext context) {
  //   if (activity.isFilled()) {
  //     return c.CupertinoDynamicColor.resolve(
  //         c.CupertinoColors.systemBlue, context);
  //   } else {
  //     return c.CupertinoDynamicColor.resolve(
  //         c.CupertinoColors.systemGrey, context);
  //   }
  // }

  void onDelete(BuildContext context) async {
    await ActivityController.delete(activity);
    Navigator.of(context, rootNavigator: true).pop();
  }

  c.CupertinoDynamicColor _getMoodColor(c.BuildContext context) {
    return c.CupertinoDynamicColor.resolve(
        activity.moodId == null
            ? c.CupertinoColors.tertiarySystemGroupedBackground
            : getColor(
                EColor.values[activity.moodId],
              ),
        context);
  }

  Widget _buildNavBar(BuildContext context) {
    return c.CupertinoNavigationBar(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      leading: Container(),
      middle:
          activity.isFilled() ? Text("Edit Activity") : Text("Add Acitvity"),
      trailing: c.CupertinoButton(
        onPressed: noteController.value.text != "" &&
                titleController.value.text != "" &&
                activity.moodId != null
            ? () => onDone(context)
            : null,
        child: Text(
          "Done",
          //style: TextStyle(color: _getButtonColor(context)),
        ),
        padding: c.EdgeInsets.zero,
      ),
      border: null,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 18)),
            MyContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: Style.body(context),
                  ),
                  Text(
                    "${activity.day}-${activity.month}-${activity.year}",
                    style: Style.bodySecondary(context),
                  ),
                ],
              ),
              onTap: null,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            ColorContainer(
              text: "Mood",
              color: _getMoodColor(context),
              onTap: () async {
                dynamic moodId =
                    await Navigator.of(context).pushNamed("edit/mood");
                setState(() {
                  activity.moodId = moodId;
                });
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
                onChanged: (value) => setState(() {}),
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
                onChanged: (value) => setState(() {}),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            activity.isFilled()
                ? c.CupertinoButton(
                    child: Text("DELETE"),
                    onPressed: () => onDelete(context),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemGrey6,
        context,
      ),
      navigationBar: _buildNavBar(context),
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

/// Activity Route Initializer initialises the activity route.
///
/// [ActivityEditSheet] initial route.
/// Takes confirmation before poping the scope with [CupertinoActionSheet]
class ActivityRouteInitializer extends StatelessWidget {
  ActivityRouteInitializer(this.activity);

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
