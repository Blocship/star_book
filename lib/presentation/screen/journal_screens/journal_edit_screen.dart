import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/journal_edit_cubit.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/calendar.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class JournalEditScreen extends StatefulWidget
    implements Screen<JournalEditScreenRoute> {
  @override
  final JournalEditScreenRoute arg;

  const JournalEditScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  State<JournalEditScreen> createState() => _JournalEditScreenState();
}

class _JournalEditScreenState extends State<JournalEditScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;

    return BlocProvider<JournalEditCubit>(
      create: (context) => JournalEditCubit(
        formKey: _formKey,
        journalRepo: Injector.resolve<JournalRepo>(),
      ),
      child: BlocBuilder<JournalEditCubit, CubitState<Journal>>(
        builder: (context, state) {
          return Scaffold(
            appBar: PrimaryAppBar(
              leadingOnTap: () => context.shouldPop(),
              centerTitle: 'Mood Journal',
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CustomPadding.mediumPadding),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: deviceHeight * 0.06),
                      // todo fetch from id
                      // MoodWidget(
                      //   date: widget.journal.createdAt,
                      //   moodColor: widget.journal.mood.color,
                      //   mood: widget.journal.mood.label,
                      // ),
                      // const SizedBox(height: 30),
                      // CustomTextFormField(
                      //   fieldKey: JournalFormModel.titleKey,
                      //   heading: 'Title',
                      //   initialValue: widget.journal.title,
                      //   validator: FormValidator.compose([
                      //     FormValidator.required(),
                      //     FormValidator.minLength(3),
                      //   ]),
                      // ),
                      // SizedBox(height: deviceHeight * 0.02),
                      // CustomTextFormField(
                      //   fieldKey: JournalFormModel.memoKey,
                      //   heading: 'Note',
                      //   initialValue: widget.journal.memo,
                      //   validator: FormValidator.required(),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: SecondaryFloatingActionButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context
                      .read<JournalEditCubit>()
                      .updateJournal(journalId: widget.arg.id);
                  context.shouldPop();
                }
              },
              child: const Icon(Icons.check),
            ),
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
