import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/dialog_box.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';

class JournalDetailScreen extends StatelessWidget {
  const JournalDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.arrow_back_ios_new_outlined,
          label: 'Back',
          onTap: () => context.goNamed(AppRouterName.mainScreen),
        ),
        center: 'Mood Journal',
        trailing: PrimaryAppBarItem(
            label: 'Delete',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => const CustomDialogBox());
            }),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.06),
            const MoodWidget(
                date: '05 September 2022',
                moodColor: Colors.green,
                mood: 'Productive'),
            SizedBox(height: screenHeight * 0.04),
            const DocumentWidget(
                title: 'Title', description: 'titleDescription'),
            SizedBox(height: screenHeight * 0.02),
            const DocumentWidget(title: 'Note', description: 'noteDescription'),
          ],
        ),
      ),
      floatingActionButton: PrimaryFloatingActionButton(
        onTap: () => context.goNamed(AppRouterName.journalEditScreen),
        child: const Icon(Icons.edit_outlined),
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

class DocumentWidget extends StatelessWidget {
  final String title;
  final String description;

  const DocumentWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context)
                  .extension<ThemeColorStyle>()!
                  .secondaryColor),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
