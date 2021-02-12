import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// Files
import './dialog.dart';
import '../models/activity.dart';
import '../utils/color.dart';
import '../utils/date.dart';

/// Day widget renders color on the basis of [Activity] and [Mood]
///
/// Renders default color if [MoodId] in [Activity] is not filled
class Day extends StatelessWidget {
  final Activity activity;
  final double size;
  final bool onPressed;

  Day({
    this.activity,
    this.size,
    this.onPressed = true,
  });

  // double _squareSize(BuildContext context) {
  //   print(MediaQuery.of(context).size.width);
  //   return MediaQuery.of(context).size.width / 9;
  // }

  String _getText() {
    if (activity == null)
      return '';
    else if (activity.day == null)
      return '';
    else
      return activity.day.toString();
  }

  c.CupertinoDynamicColor _getTextColor(BuildContext context) {
    if (activity == null) {
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      );
    } else if (activity.moodId != null) {
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.tertiarySystemBackground,
        context,
      );
    } else {
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      );
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    if (activity == null) {
      // show white/transparent colors
      return Color(0x00ffffff);
    } else if (activity.moodId != null) {
      // get color by sending mood,
      int colorCode = activity.moodId;
      return c.CupertinoDynamicColor.resolve(
        getColor(MoodColor.values[colorCode]),
        context,
      );
    } else {
      // send default color
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.tertiarySystemGroupedBackground,
        context,
      );
    }
  }

  void _onDayPressed(BuildContext context) async {
    if (activity == null ||
        isAfterCurrentDate(activity.year, activity.month, activity.day)) {
      await c.showCupertinoDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: 'Cannot Add Activity',
            content:
                'You cannot add a activity for ${activity.day}-${activity.month}-${activity.year}.',
          );
        },
      );
    } else if (activity.moodId == null) {
      Navigator.of(context).pushNamed("edit", arguments: activity);
    } else {
      Navigator.of(context).pushNamed('activity', arguments: activity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double _size = (size == null) ? constraints.maxWidth : size;
        // print('day size: $_size');
        return c.CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: (onPressed && activity != null)
              ? () => _onDayPressed(context)
              : null,
          child: Container(
            height: _size,
            width: _size,
            alignment: Alignment.center,
            margin: EdgeInsets.all(_size * 0.10),
            decoration: BoxDecoration(
              color: _getBackgroundColor(context),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              _getText(),
              style: TextStyle(
                fontSize: _size * 0.5,
                color: _getTextColor(context),
              ),
            ),
          ),
        );
      },
    );
  }
}
