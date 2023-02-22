import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/form_validator.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class JournalCreateScreen extends StatefulWidget {
  const JournalCreateScreen({Key? key}) : super(key: key);

  @override
  State<JournalCreateScreen> createState() => _JournalCreateScreenState();
}

class _JournalCreateScreenState extends State<JournalCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PrimaryAppBar(
        leadingOnTap: () => context.pop(),
        centerTitle: 'New Thought',
      ),
      body: SafeArea(
        minimum:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
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
                SelectableTile(
                  title: 'Date',
                  onTap: () => context.goNamed(AppRouterName.datePickerScreen),
                ),
                const SizedBox(height: 30),
                SelectableTile(
                  title: 'Mood',
                  onTap: () => context.goNamed(AppRouterName.moodPickerScreen),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  fieldKey: 'EnterMood',
                  heading: 'Title',
                  label: 'Enter Mood Title',
                  validator: FormValidator.compose([
                    FormValidator.required(),
                    FormValidator.minLength(3),
                  ]),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  fieldKey: 'WriteNote',
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
