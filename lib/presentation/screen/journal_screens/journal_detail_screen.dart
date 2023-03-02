import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/journal_detail_cubit.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/dialog_box.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class JournalDetailScreen extends StatelessWidget {
  const JournalDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;

    return BlocProvider<JournalDetailCubit>(
        create: (context) => JournalDetailCubit(
              journalRepo: Injector.resolve<JournalRepo>(),
            )..fetchJournals(),
        child: BlocBuilder<JournalDetailCubit, CubitState>(
            builder: (context, state) {
          // final deleteJournal = context.read<JournalDetailCubit>().deleteJournal(journalId: journalId);
          // final getJournalById = context.read<JournalDetailCubit>().journalById$(journalId: journalId);
          return Scaffold(
            appBar: PrimaryAppBar(
              leadingOnTap: () => context.goNamed('AppRouterName.mainScreen'),
              centerTitle: 'Mood Journal',
              trailingText: 'Delete',
              trailingOnTap: () {
                showDialog(
                    context: context,
                    builder: (context) => const CustomDialogBox());
              },
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CustomPadding.mediumPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: deviceHeight * 0.06),
                    const MoodWidget(
                        date: '05 September 2022',
                        moodColor: Colors.green,
                        mood: 'Productive'),
                    SizedBox(height: deviceHeight * 0.04),
                    const DocumentWidget(
                        title: 'Title', description: 'titleDescription'),
                    SizedBox(height: deviceHeight * 0.02),
                    const DocumentWidget(
                        title: 'Note', description: 'noteDescription'),
                  ],
                ),
              ),
            ),
            floatingActionButton: PrimaryFloatingActionButton(
              onTap: () => context.goNamed(AppRouterName.journalEditScreen),
              child: const Icon(Icons.edit_outlined),
            ),
          );
        }));
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
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;

    return SizedBox(
      width: deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: themeColorStyle.secondaryColor),
          ),
          SizedBox(height: deviceHeight * 0.04),
          CircleAvatar(
            backgroundColor: moodColor,
            radius: deviceWidth * 0.075,
          ),
          SizedBox(height: deviceHeight * 0.02),
          Text(
            mood,
            style:
                textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700),
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
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: themeColorStyle.secondaryColor),
        ),
        SizedBox(height: deviceHeight * 0.01),
        Text(
          description,
          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
