import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<dynamic> bottomSheet({BuildContext context, Widget child}) {
  return showCupertinoModalBottomSheet(
    expand: true,
    context: context,
    backgroundColor: Color.fromARGB(0, 255, 255, 255),
    builder: (context, scrollController) => child,
  );
}
