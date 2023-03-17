import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/date_picker.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';

class CustomDatePickerFormField extends FormBuilderField<DateTime> {
  CustomDatePickerFormField({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.onChanged,
    super.valueTransformer,
    super.enabled = true,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
  }) : super(builder: (final FormFieldState<DateTime> field) {
          final state = field as _CustomDatePickerFormFieldState;

          return Focus(
            focusNode: state.effectiveFocusNode,
            canRequestFocus: state.effectiveFocusNode.canRequestFocus,
            child: SelectableTile(
                title: 'Date',
                select: DateFormat.yMMMd().format(
                  state.dateTime ?? DateTime.now(),
                ),
                onTap: () {
                  state.effectiveFocusNode.requestFocus();
                }),
          );
        });

  @override
  FormBuilderFieldState<CustomDatePickerFormField, DateTime> createState() =>
      _CustomDatePickerFormFieldState();
}

class _CustomDatePickerFormFieldState
    extends FormBuilderFieldState<CustomDatePickerFormField, DateTime> {
  late DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = widget.initialValue;
    effectiveFocusNode.addListener(_handleFocus);
  }

  void _handleFocus() {
    if (effectiveFocusNode.hasFocus && enabled) {
      effectiveFocusNode.unfocus();
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return DatePickerBottomSheet(
            initialDate: dateTime ?? DateTime.now(),
            onDone: (DateTime date) {
              setState(() {
                dateTime = date;
              });
              didChange(dateTime);
            },
            // onDateChanged: (DateTime date) {
            //   setState(() {
            //     dateTime = date;
            //   });
            //   didChange(dateTime);
            // },
          );
        },
      );
    }
  }
}

class DatePickerBottomSheet extends StatefulWidget {
  final DateTime initialDate;
  // @deprecated
  // final Function(DateTime dateTime)? onDateChanged;
  final Function(DateTime dateTime)? onDone;

  const DatePickerBottomSheet({
    Key? key,
    required this.initialDate,
    // @deprecated
    // required this.onDateChanged,
    required this.onDone,
  }) : super(key: key);

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;

    return Scaffold(
      appBar: const PrimaryAppBar(
        showLeading: false,
        centerTitle: 'Select Date',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CustomPadding.mediumPadding,
        ),
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
              initialDate: widget.initialDate,
              onDateChanged: (DateTime date) {
                setState(() {
                  dateTime = date;
                });
                // widget.onDateChanged?.call(date);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SecondaryFloatingActionButton(
        onTap: () {
          widget.onDone?.call(dateTime);
          context.shouldPop();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
