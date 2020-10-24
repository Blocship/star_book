import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';
import '../utils/color.dart';

/// Day widget renders color on the basis of [Activity] and [Mood]
///
/// Renders default color if [MoodId] in [Activity] is not filled
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
    if (activity.moodId != null) {
      int colorCode = activity.moodId;
      return c.CupertinoDynamicColor.resolve(
          getColor(EColor.values[colorCode]), context);
    } else {
      return c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.tertiarySystemGroupedBackground, context);
    }
  }

  void _onTap(context) {
    if (activity == null)
      return;
    else if (activity.moodId == null)
      Navigator.of(context).pushNamed("/edit", arguments: activity);
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
          style: TextStyle(
            fontSize: _squareSize(context) * 0.55,
            color: c.CupertinoDynamicColor.resolve(
                c.CupertinoColors.label, context),
          ),
        ),
      ),
    );
  }
}
