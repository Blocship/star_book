import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as c;
// Files
import '../widgets/my_container.dart';

/// Cupertino style color action container widget
class ColorContainer extends StatelessWidget {
  const ColorContainer({
    required this.text,
    required this.color,
    this.onTap,
  });

  final String text;
  final Color color;
  final VoidCallback? onTap;

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
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 9),
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
