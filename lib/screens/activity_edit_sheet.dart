import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:star_book/screens/home_page.dart';
// Files
import '../routes/route_generator.dart';
import '../utils/bottom_sheet.dart';
import '../widgets/action_container.dart';
import '../models/activity.dart';

class ActivitiyEditSheetRouteInitializer extends StatefulWidget {
  @override
  final Activity activity;

  const ActivitiyEditSheetRouteInitializer(this.activity);

  _ActivitiyEditSheetRouteInitializer createState() =>
      _ActivitiyEditSheetRouteInitializer();
}

class _ActivitiyEditSheetRouteInitializer
    extends State<ActivitiyEditSheetRouteInitializer> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.addListener(test);
    noteController.addListener(test);
  }

  void test() {
    print(titleController.text);
    print(noteController.text);
  }

  Future<bool> _handlePopScope(BuildContext context) async {
    bool shouldClose = true;
    await c.showCupertinoDialog(
        context: context,
        builder: (context) => c.CupertinoAlertDialog(
              title: Text('Should Close Activity Edit Sheet?}'),
              actions: <Widget>[
                c.CupertinoButton(
                  child: Text('Yes'),
                  onPressed: () {
                    shouldClose = true;
                    Navigator.of(context).pop();
                  },
                ),
                c.CupertinoButton(
                  child: Text('No'),
                  onPressed: () {
                    shouldClose = false;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
    return shouldClose;
  }

  Widget _buildNavBar() {
    return c.CupertinoNavigationBar(
      leading: Container(),
      middle: Text("Add/Edit"),
      trailing: GestureDetector(
        onTap: () {
          // TODO: fix error
          Navigator.of(context).pop();
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
            textContainer(
              context: context,
              child: Text("Date"),
              onTap: null,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            ActionContainer(
              text: "Mood",
              icon: c.CupertinoIcons.right_chevron,
              onTap: () => Navigator.of(context).pushNamed("/mood"),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            textContainer(
              context: context,
              child: c.CupertinoTextField(
                controller: titleController,
                placeholder: "Title",
                decoration: null,
                maxLines: 1,
                onTap: null,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            textContainer(
              context: context,
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
    return WillPopScope(
      onWillPop: () => _handlePopScope(context),
      child: c.CupertinoPageScaffold(
        backgroundColor: c.CupertinoColors.systemGroupedBackground,
        navigationBar: _buildNavBar(),
        child: _buildBody(context),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
