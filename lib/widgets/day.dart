import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';
import '../utils/color.dart';

class Day extends StatelessWidget {
  final Activity activity;

  Day({this.activity});

  double _squareSize(context) {
    // TODO: based on the size of the screen, adjust the size of square.
    return 43;
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

// class MyButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('MyButton was tapped!');
//       },
//       child: Container(
//         height: 36.0,
//         padding: const EdgeInsets.all(8.0),
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0),
//           color: Colors.lightGreen[500],
//         ),
//         child: Center(
//           child: Text('Engage'),
//         ),
//       ),
//     );
//   }
// }
