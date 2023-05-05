import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/journal_detail_cubit.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/journal_screens/journal_edit_screen.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/dialog_box.dart';
import 'package:star_book/presentation/shared/loader.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/calendar.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class JournalDetailScreenRoute extends RouteArg {
  static const String path = '/journal/:id';

  final String id;
  const JournalDetailScreenRoute({required this.id}) : super();

  @override
  Uri get uri => Uri(path: '$path/$id');
}

class JournalDetailScreen extends StatelessWidget
    implements Screen<JournalDetailScreenRoute> {
  @override
  final JournalDetailScreenRoute arg;
  const JournalDetailScreen({super.key, required this.arg});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;

    return BlocProvider<JournalDetailCubit>(
      create: (context) => JournalDetailCubit(
        journalRepo: Injector.resolve<JournalRepo>(),
      )..journalById$(journalId: arg.id),
      child: BlocBuilder<JournalDetailCubit, CubitState<Journal>>(
        builder: (context, state) {
          return state.when(
            initial: () => const Loader(),
            loading: () => const Loader(),
            loaded: (journal) {
              return Scaffold(
                appBar: PrimaryAppBar(
                  leadingOnTap: () =>
                      context.goNamed('AppRouterName.mainScreen'),
                  centerTitle: 'Mood Journal',
                  trailingText: 'Delete',
                  trailingOnTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialogBox(journalId: arg.id),
                    );
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
                        MoodWidget(
                          date: journal.createdAt,
                          moodColor: journal.mood.color,
                          mood: journal.mood.label,
                        ),
                        SizedBox(height: deviceHeight * 0.04),
                        DocumentWidget(
                          title: 'Title',
                          description: journal.title,
                        ),
                        SizedBox(height: deviceHeight * 0.02),
                        DocumentWidget(
                          title: 'Note',
                          description: journal.memo,
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: PrimaryFloatingActionButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            JournalEditScreen(journal: journal),
                      ),
                    );
                  },
                  child: const Icon(Icons.edit_outlined),
                ),
              );
            },
            error: (e) => Text(e.toString()),
          );
        },
      ),
    );
  }
}

class MoodWidget extends StatelessWidget {
  final DateTime date;
  final int moodColor;
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
    final formattedDate =
        '${date.day} ${CalendarUtils.getFullMonthName(date.month)} ${date.year}';
    return SizedBox(
      width: deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            formattedDate,
            style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                color: themeColorStyle.secondaryColor),
          ),
          SizedBox(height: deviceHeight * 0.04),
          CircleAvatar(
            backgroundColor: Color(moodColor),
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
