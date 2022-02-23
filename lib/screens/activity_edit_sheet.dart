import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:star_book/screens/date_picker_sheet.dart';
import 'package:star_book/screens/mood_sheet.dart';

// Files
import '../controllers/activity.dart';
import '../models/activity.dart';
import '../routes/route_generator.dart';
import '../styles/style.dart';
import '../utils/color.dart';
import '../utils/enums.dart';
import '../widgets/color_container.dart';
import '../widgets/my_container.dart';

/// Activity Add and Edit Sheet Screen widget.
///
/// Input form to create update and delete [Activity]
class ActivityEditSheet extends StatefulWidget {
  static const String route = '/edit/title';
  ActivityEditSheet(this.activity);

  final Activity activity;

  @override
  _ActivityEditSheetState createState() => _ActivityEditSheetState();
}

class _ActivityEditSheetState extends State<ActivityEditSheet> {
  Activity? activity;
  late ActivityType type;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    activity = Activity.from(widget.activity);
    titleController.text = activity?.title ?? '';
    noteController.text = activity?.note ?? '';
    type = (activity?.moodId == null) ? ActivityType.add : ActivityType.edit;
    titleController.addListener(onTitleChange);
    noteController.addListener(onNoteChange);
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void onTitleChange() {
    this.activity = this.activity?.copyWith(title: titleController.text);
    setState(() {});
  }

  void onNoteChange() {
    this.activity = this.activity?.copyWith(note: noteController.text);
    setState(() {});
  }

  void onDone(BuildContext context) async {
    if (activity!.isFilled()) {
      ActivityController.update(activity!);
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  void onDelete(BuildContext context) async {
    await ActivityController.delete(activity!);
    Navigator.of(context, rootNavigator: true).pop();
  }

  void onMoodTap() async {
    dynamic moodId = await Navigator.of(context).pushNamed(MoodSheet.route);
    activity = activity?.copyWith(moodId: moodId);
    setState(() {});
  }

  void onDateTap() async {
    dynamic date = await Navigator.of(context)
        .pushNamed(DatePickerSheet.route, arguments: {'day': activity?.day, 'month': activity?.month, 'year': activity?.year});

    // After getting date update the state.
    setState(() {
      activity = ActivityController.readAt(date['day'], date['month'], date['year']);
      titleController.text = activity?.title == null ? '' : activity!.title!;
      noteController.text = activity?.note == null ? '' : activity!.note!;
      type = (activity?.moodId == null) ? ActivityType.add : ActivityType.edit;
    });
  }

  c.Color _getMoodColor(c.BuildContext context) {
    return c.CupertinoDynamicColor.resolve(
        activity?.moodId == null
            ? c.CupertinoColors.tertiarySystemGroupedBackground
            : getColor(
                MoodColor.values[activity!.moodId!],
              ),
        context);
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemGrey6,
        context,
      ),
      navigationBar: c.CupertinoNavigationBar(
        backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6,
          context,
        ),
        leading: Container(),
        middle: Text('${(type == ActivityType.add) ? 'Add' : 'Edit'} Activity'),
        trailing: c.CupertinoButton(
          onPressed: activity!.isFilled() ? () => onDone(context) : null,
          child: const Text('Done'),
          padding: EdgeInsets.zero,
        ),
        border: null,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 18)),
              MyContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date',
                      style: Style.body(context),
                    ),
                    Text(
                      '${activity!.dateFormat()}',
                      style: Style.bodySecondary(context),
                    ),
                  ],
                ),
                onTap: onDateTap,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              ColorContainer(
                text: 'Mood',
                color: _getMoodColor(context),
                onTap: onMoodTap,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              MyContainer(
                child: c.CupertinoTextField(
                  controller: titleController,
                  placeholder: 'Title',
                  decoration: null,
                  maxLines: 1,
                  onTap: null,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              MyContainer(
                child: c.CupertinoTextField(
                  controller: noteController,
                  placeholder: 'Note',
                  decoration: null,
                  maxLines: null,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  onTap: null,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              (type == ActivityType.add)
                  ? Container()
                  : c.CupertinoButton(
                      child: Text('DELETE'),
                      onPressed: () => onDelete(context),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Activity Route Initializer initialises the activity route.
///
/// [ActivityEditSheet] initial route.
/// Takes confirmation before poping the scope with [CupertinoActionSheet]
class ActivityRouteInitializer extends StatelessWidget {
  static const String route = '/edit';
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
            child: Text('Discard Changes'),
            isDestructiveAction: true,
          ),
        ],
        cancelButton: c.CupertinoActionSheetAction(
          onPressed: () {
            shouldClose = false;
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
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
        initialRoute: ActivityEditSheet.route,
        onGenerateRoute: (settings) => RouteGenerator.activityRoute(settings, activity),
      ),
    );
  }
}
