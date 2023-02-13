import 'dart:developer';

import 'package:flutter/material.dart';

class MoodTile extends StatelessWidget {
  final String title;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  const MoodTile({
    Key? key,
    required this.title,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(isSelected.toString());

    ///TODO: remove splash color from theme
    return ListTile(
      dense: true,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isSelected ? color : Colors.transparent, width: 2.0),
          borderRadius: BorderRadius.circular(8)),
      tileColor: color.withOpacity(0.1),
      onTap: onTap,
      leading: Text(
        title,
        style: TextStyle(color: color),
      ),
      trailing: CircleAvatar(
        radius: 8,
        backgroundColor: color,
      ),
      selected: isSelected,
    );
  }
}
