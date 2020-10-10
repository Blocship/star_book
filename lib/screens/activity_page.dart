import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';

// TODO: display activity in cupertino style,
// added just to implement route,
// will complete it later.
class ActivityPage extends StatelessWidget {
  ActivityPage(this.activity);

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
                child: c.Text(activity.mood.label),
              ),
              c.Container(
                padding: c.EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: c.Text(
                  activity.title,
                  style: c.CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle
                      .copyWith(),
                ),
              ),
              c.Container(
                padding: c.EdgeInsets.all(16),
                child: c.Text("${activity.note}\n    " +
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry." +
                    " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," +
                    " when an unknown printer took a galley of type and scrambled it to make a type specimen book." +
                    " It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. " +
                    "\n It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages," +
                    "\n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." +
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry." +
                    " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," +
                    "\n when an unknown printer took a galley of type and scrambled it to make a type specimen book." +
                    " It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. " +
                    " and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
