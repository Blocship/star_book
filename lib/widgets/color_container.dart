import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as c;
// Files
import '../widgets/my_container.dart';

/// Cupertino style color action container widget
class ColorContainer extends StatelessWidget {
  ColorContainer({
    this.text,
    this.color,
    this.onTap,
  });

  final String text;
  final c.CupertinoDynamicColor color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: c.CupertinoDynamicColor.resolve(
                c.CupertinoColors.label,
                context,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: c.CupertinoDynamicColor.resolve(color, context),
              shape: c.BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
