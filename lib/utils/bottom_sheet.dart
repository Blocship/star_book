import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Colors;

CupertinoModalBottomSheetRoute<dynamic> ModalBottomSheetRouteWrapper(
    {Widget Function(BuildContext, ScrollController) builder}) {
  return CupertinoModalBottomSheetRoute<dynamic>(
    expanded: true,
    builder: builder,
    containerBuilder: (context, animation, child) =>
        CupertinoBottomSheetContainer(
      topRadius: Radius.circular(10),
      child: child,
    ),
  );
}

const double _behind_widget_visible_height = 10;

/// Cupertino Bottom Sheet Container
///
/// Clip the child widget to rectangle with top rounded corners and adds
/// top padding(+safe area padding). This padding [_behind_widget_visible_height]
/// is the height that will be displayed from previous route.
class CupertinoBottomSheetContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Radius topRadius;

  const CupertinoBottomSheetContainer(
      {Key key, this.child, this.backgroundColor, @required this.topRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topSafeAreaPadding = MediaQuery.of(context).padding.top;
    final topPadding = _behind_widget_visible_height + topSafeAreaPadding;

    final shadow =
        BoxShadow(blurRadius: 10, color: Colors.black12, spreadRadius: 5);
    final _backgroundColor =
        backgroundColor ?? c.CupertinoTheme.of(context).scaffoldBackgroundColor;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: topRadius),
        child: Container(
          decoration:
              BoxDecoration(color: _backgroundColor, boxShadow: [shadow]),
          width: double.infinity,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true, //Remove top Safe Area
            child: child,
          ),
        ),
      ),
    );
  }
}
