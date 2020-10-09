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
Widget textContainer({
  Widget child,
  Function onTap,
  @required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap != null ? onTap : null,
    child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: EdgeInsets.fromLTRB(13, 15, 13, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: c.CupertinoDynamicColor.resolve(
            c.CupertinoColors.secondarySystemGroupedBackground,
            context,
          ),
        ),
        child: child),
  );
}
