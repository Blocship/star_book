import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

/// Cupertino style container widget
class MyContainer extends StatelessWidget {
  MyContainer({
    @required this.child,
    this.onTap,
    this.margin,
    this.padding,
    this.width,
    this.height,
  });

  final Widget child;
  final Function onTap;
  final EdgeInsets margin;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin ?? EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: padding ?? EdgeInsets.fromLTRB(13, 15, 13, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
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
