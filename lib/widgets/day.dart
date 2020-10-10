import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';
import '../utils/color.dart';
import '../screens/activity_edit_sheet.dart';
import '../utils/bottom_sheet.dart';

class Day extends StatelessWidget {
  final Activity activity;

  Day({this.activity});

  double _squareSize(context) {
    return c.MediaQuery.of(context).size.width / 9;
  }

  String _getText() {
    if (activity == null)
      return '';
    else if (activity.day == null)
      return '';
    else
      return activity.day.toString();
  }

  Color _getBackgroundColor(BuildContext context) {
    // if activity.day == null then show white/transparent color
    if (activity == null)
      return Color(0x00ffffff);
    else
    // get color by sending mood, if not, then it will send default color
    if (activity.mood != null) {
      int colorCode = activity.mood.colorCode;
      return c.CupertinoDynamicColor.resolve(
          getColor(EColor.values[colorCode]), context);
    } else {
      return c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context);
    }
  }

  void _onTap(context) {
    if (activity == null)
      return;
    else if (activity.mood == null)
      bottomSheet(context: context, child: ActivityEditSheetRouteInitializer());
    else
      Navigator.of(context).pushNamed('/activity', arguments: activity);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        height: _squareSize(context),
        width: _squareSize(context),
        alignment: Alignment.center,
        margin: EdgeInsets.all(_squareSize(context) * 0.10),
        decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: BorderRadius.circular(_squareSize(context) / 5)),
        child: Text(
          _getText(),
          // TODO: set color white for colored boxes.
          style: TextStyle(fontSize: _squareSize(context) * 0.55),
        ),
      ),
    );
  }
}
