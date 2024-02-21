import 'package:flutter/material.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class JournalTile extends StatelessWidget {
  final Journal journal;

  const JournalTile({super.key, required this.journal});

  Color get moodColor => Color(journal.mood.color);

  Color get cardColor => moodColor.withOpacity(0.05);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;

    return GestureDetector(
      onTap: () {
        context.pushScreen(
          arg: JournalDetailScreenRoute(id: journal.id),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: moodColor,
            ),
            const SizedBox(height: 10),
            Text(
              // 'Feeling Productive',
              journal.title,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColorStyle.secondaryColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              journal.memo,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
