import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/shared/form_models/jounral_form_model.dart';
import 'package:star_book/presentation/shared/form_validator.dart';
import 'package:star_book/presentation/utils/extension.dart';

import 'package:star_book/presentation/widgets/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';

class JournalEditScreen extends StatefulWidget {
  const JournalEditScreen({Key? key}) : super(key: key);

  @override
  State<JournalEditScreen> createState() => _JournalEditScreenState();
}

class _JournalEditScreenState extends State<JournalEditScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;

    return Scaffold(
      appBar: PrimaryAppBar(
        leadingOnTap: () => context.goNamed(AppRouterName.journalDetailScreen),
        centerTitle: 'Mood Journal',
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
                mood: 'Productive',
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                fieldKey: JournalFormModel.titleKey,
                heading: 'Title',
                initialValue: 'titleDescription',
                validator: FormValidator.compose([
                  FormValidator.required(),
                  FormValidator.minLength(3),
                ]),
              ),
              SizedBox(height: deviceHeight * 0.02),
              CustomTextFormField(
                fieldKey: JournalFormModel.memoKey,
                heading: 'Note',
                initialValue: 'noteDescription',
                validator: FormValidator.required(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SecondaryFloatingActionButton(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            context.goNamed(AppRouterName.journalDetailScreen);
          }
        },
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
