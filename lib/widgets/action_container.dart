import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as c;

// Cupertino style action container
class ActionContainer extends StatelessWidget {
  ActionContainer({this.text, this.icon, this.onTap});

  final String text;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? onTap : null,
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: EdgeInsets.fromLTRB(13, 15, 13, 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: c.CupertinoColors.secondarySystemGroupedBackground),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(color: c.CupertinoColors.label),
            ),
            Icon(
              icon,
              color: c.CupertinoColors.tertiaryLabel,
            ),
          ],
        ),
      ),
    );
  }
}
