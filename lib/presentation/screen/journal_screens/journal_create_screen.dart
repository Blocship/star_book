import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/cubits/cubit_state/cubit_state.dart';
import 'package:star_book/cubits/journal_create_cubit.dart';
import 'package:star_book/domain/models/journal/journal.dart';
import 'package:star_book/domain/models/mood/day.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/screen/date_picker_screen.dart';
import 'package:star_book/presentation/screen/mood_picker_screen.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/form_models/jounral_form_model.dart';
import 'package:star_book/presentation/shared/form_validator.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/calendar.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';
import 'package:star_book/presentation/routes/routes.dart';

class JournalCreateScreenRoute extends RouteArg {
  // ?date=2020-01-01
  static const String path = '/journal/new';

  final Day? day;

  const JournalCreateScreenRoute({this.day});

  @override
  Uri get uri => Uri(path: path, queryParameters: {
        if (day != null) 'date': day!.dayKey,
      });
}

class JournalCreateScreen extends StatefulWidget
    implements Screen<JournalCreateScreenRoute> {
  @override
  final JournalCreateScreenRoute arg;
  Mood? mood;

  JournalCreateScreen({
    super.key,
    required this.arg,
    this.mood,
  });

  @override
  State<JournalCreateScreen> createState() => _JournalCreateScreenState();
}

class _JournalCreateScreenState extends State<JournalCreateScreen> {
  String? selectedDate;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JournalCreateCubit>(
      create: (context) => JournalCreateCubit(
        journalRepo: Injector.resolve<JournalRepo>(),
        formKey: _formKey,
      ),
      child: BlocBuilder<JournalCreateCubit, CubitState<Journal>>(
        builder: (context, state) {
          // final addJournal = context.read<JournalCreateCubit>().addJournal();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PrimaryAppBar(
              leadingOnTap: () => context.pop(),
              centerTitle: 'New Thought',
            ),
            body: SafeArea(
              minimum: const EdgeInsets.symmetric(
                  horizontal: CustomPadding.mediumPadding),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),
                      const AddNewDetails(),
                      const SizedBox(height: 30),
                      SelectableDateTile(
                        title: 'Date',
                        select: selectedDate,
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => DatePickerScreen(
                              onDateSelected: (DateTime) {
                                setState(() {
                                  selectedDate =
                                      '${CalendarUtils.getMonthName(DateTime.month)} ${DateTime.day}, ${DateTime.year}';
                                });
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      SelectableMoodTile(
                        title: 'Mood',
                        select: widget.mood?.label,
                        color: Color(widget.mood?.color ?? 0xFFFFFFFF),
                        onTap: () async {
                          Mood? selectedMood = await showModalBottomSheet<Mood>(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const MoodPickerScreen();
                            },
                          );
                          setState(() {
                            widget.mood = selectedMood;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        fieldKey: JournalFormModel.titleKey,
                        heading: 'Title',
                        label: 'Enter Mood Title',
                        validator: FormValidator.compose([
                          FormValidator.required(),
                          FormValidator.minLength(3),
                        ]),
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        fieldKey: JournalFormModel.memoKey,
                        heading: 'Note',
                        label: 'Write Note',
                        isMultiline: true,
                        validator: FormValidator.required(),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: SecondaryFloatingActionButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ///Todo: Here we can't pop screen or we need to handle data from pop()
                    context.pop();
                  }
                },
                child: const Icon(Icons.check)),
          );
        },
      ),
    );
  }
}

class AddNewDetails extends StatelessWidget {
  const AddNewDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: deviceWidth * 0.02),
        const Image(image: AssetImage('assets/icons/book.png'), height: 36),
        SizedBox(width: deviceWidth * 0.03),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Details',
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColorStyle.secondaryColor,
              ),
            ),
            SizedBox(height: deviceHeight * 0.004),
            Text(
              'Write your today’s thought details below',
              style:
                  textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
