import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

/// Cupertino style container widget
class MyContainer extends StatelessWidget {
  MyContainer({
    @required this.child,
    this.onTap,
  });

  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap != null ? onTap : null,
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: EdgeInsets.fromLTRB(13, 15, 13, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: c.CupertinoDynamicColor.resolve(
            c.CupertinoColors.tertiarySystemBackground,
            context,
          ),
        ),
        child: child,
      ),
    );
  }
}
