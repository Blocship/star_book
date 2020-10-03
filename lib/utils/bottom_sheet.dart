import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// Bottom sheet wrapper
Future<dynamic> bottomSheet({BuildContext context, Widget child}) {
  return showCupertinoModalBottomSheet(
    expand: true,
    context: context,
    backgroundColor: Color.fromARGB(0, 255, 255, 255),
    builder: (context, scrollController) => child,
  );
}

// Cupertino style text container
Widget textContainer(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6), color: c.CupertinoColors.white),
    child: Text(
      text,
      textAlign: TextAlign.left,
    ),
  );
}
