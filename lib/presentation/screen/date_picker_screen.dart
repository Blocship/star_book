import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/date_picker.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class CustomDatePickerFormField extends FormBuilderField<DateTime> {
  final String name;

  CustomDatePickerFormField({
    Key? key,
    required this.name,
  }) : super(
            key: key,
            name: name,
            builder: (FormFieldState<DateTime> field) {
              return SelectableTile(
                  title: 'Date',
                  onTap: () {
                    showModalBottomSheet(
                      context: field.context,
                      builder: (context) {
                        return DatePickerScreen();
                      },
                    );
                  });
            });

  @override
  FormBuilderFieldState<CustomDatePickerFormField, DateTime> createState() =>
      _CustomDatePickerFormFieldState();
}

class _CustomDatePickerFormFieldState
    extends FormBuilderFieldState<CustomDatePickerFormField, DateTime> {}

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;

    return Scaffold(
      appBar: PrimaryAppBar(
        leadingOnTap: () => context.shouldPop(),
        centerTitle: 'Select Date',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              height: deviceHeight * 0.06,
              decoration: BoxDecoration(
                color: themeColorStyle.septenaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Text(
                'MM--DD--YY',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: themeColorStyle.secondaryColor,
                ),
              ),
            ),
            const SizedBox(height: 30),
            DatePicker(
              onDateChanged: (DateTime date) {},
            ),
          ],
        ),
      ),
      floatingActionButton: SecondaryFloatingActionButton(
        onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
        child: const Icon(Icons.check),
      ),
    );
  }
}
