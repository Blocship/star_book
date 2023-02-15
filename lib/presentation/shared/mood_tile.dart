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
    return ListTile(
      dense: true,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isSelected ? color : Colors.transparent, width: 2.0),
          borderRadius: BorderRadius.circular(8)),
      tileColor: color.withOpacity(0.1),
      selectedTileColor: color.withOpacity(0.1),
      onTap: onTap,
      leading: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: isSelected ? color : color.withOpacity(0.4)),
      ),
      trailing: CircleAvatar(
        radius: 6,
        backgroundColor: isSelected ? color : color.withOpacity(0.4),
      ),
      selected: isSelected,
    );
  }
}
