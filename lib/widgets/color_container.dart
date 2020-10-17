import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as c;
// Files
import '../widgets/my_container.dart';

// Color action container
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
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: c.CupertinoDynamicColor.resolve(color, context),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
