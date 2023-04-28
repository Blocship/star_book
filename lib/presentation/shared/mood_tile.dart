import 'package:flutter/material.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/presentation/utils/extension.dart';

class MoodTile extends StatelessWidget {
  final String title;
  final Color color;
  final Mood? selectedMood;
  final VoidCallback onTap;
  const MoodTile({
    Key? key,
    required this.title,
    required this.color,
    this.selectedMood,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    if (selectedMood != null) {
      isSelected = selectedMood?.label == title;
    }
    final TextTheme textTheme = context.textTheme;
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
        style: textTheme.bodyLarge!.copyWith(
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
