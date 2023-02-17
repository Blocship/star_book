import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';

class JournalEditScreen extends StatelessWidget {
  final String date;
  // final Color moodColor;
  final String mood;
  final String titleDescription;
  final String noteDescription;

  const JournalEditScreen({
    Key? key,
    required this.date,
    // required this.moodColor,
    required this.mood,
    required this.titleDescription,
    required this.noteDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.arrow_back_ios_new_outlined,
          label: 'Back',
          onTap: () => context.goNamed('JournalDetailScreen', params: {
            'detailDate': '05 September 2022',
            // 'detailMoodColor': ,
            'detailMood': 'Productive',
            'detailTitleDescription': 'Feeling Productive',
            'detailNoteDescription': 'Feeling Productive Feeling Productive',
          }),
        ),
        center: 'Mood Journal',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.06),
            MoodWidget(date: date, moodColor: Colors.green, mood: mood),
            SizedBox(height: screenHeight * 0.04),
            CustomTextFormField(
                heading: 'Title', initialValue: titleDescription),
            SizedBox(height: screenHeight * 0.02),
            CustomTextFormField(heading: 'Note', initialValue: noteDescription),
          ],
        ),
      ),
      floatingActionButton: SecondaryFloatingActionButton(
        onTap: () => context.goNamed('JournalDetailScreen', params: {
          'detailDate': '05 September 2022',
          // 'detailMoodColor': ,
          'detailMood': 'Productive',
          'detailTitleDescription': 'Feeling Productive',
          'detailNoteDescription': 'Feeling Productive Feeling Productive',
        }),
        child: const Icon(Icons.check),
      ),
    );
  }
}

class MoodWidget extends StatelessWidget {
  final String date;
  final Color moodColor;
  final String mood;

  const MoodWidget({
    Key? key,
    required this.date,
    required this.moodColor,
    required this.mood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                    .extension<ThemeColorStyle>()!
                    .secondaryColor),
          ),
          SizedBox(height: screenHeight * 0.04),
          CircleAvatar(
            backgroundColor: moodColor,
            radius: screenWidth * 0.075,
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            mood,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
