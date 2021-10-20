import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

const kMargin = const EdgeInsets.fromLTRB(16, 0, 16, 0);
const kPadding = const EdgeInsets.fromLTRB(13, 15, 13, 12);
final kBorderRadus = BorderRadius.circular(8);

/// Cupertino style container widget
class MyContainer extends StatelessWidget {
  const MyContainer({
    required this.child,
    this.onTap,
    this.margin,
    this.padding,
    this.boxDecoration,
    this.width,
    this.height,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? boxDecoration;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin ?? kMargin,
        padding: padding ?? kPadding,
        decoration: boxDecoration ??
            BoxDecoration(
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
