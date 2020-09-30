import 'package:flutter/widgets.dart';
// Files
import '../models/activity.dart';

class Day extends StatelessWidget {
  final Activity activity;

  Day({this.activity});

  double _squareSize(context) {
    // TODO: based on the size of the screen, we will adjust the size of square.
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

  int _getColor() {
    // if activity.day == null then show white/transparent color
    if (activity == null)
      return 0x00ffffff;
    else
      // else
      // TODO: get color by sending mood, if not, then it will send default color
      return 0xffe7e7e7;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 255, 0, 0),
      height: _squareSize(context),
      width: _squareSize(context),
      alignment: Alignment.center,
      margin: EdgeInsets.all(_squareSize(context) * 0.10),
      decoration: BoxDecoration(
          color: Color(_getColor()),
          borderRadius: BorderRadius.circular(_squareSize(context) / 5)),
      child: Text(
        _getText(),
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
