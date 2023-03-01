import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const PrimaryTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w400,
          color: themeColorStyle.tertiaryColor,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.all(16.0),
        filled: true,
        fillColor: themeColorStyle.quinaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: themeColorStyle.octonaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: themeColorStyle.octonaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: themeColorStyle.octonaryColor,
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  final String heading;
  final String? label;
  final String? initialValue;
  final bool isMultiline;
  final String fieldKey;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    Key? key,
    required this.heading,
    this.label,
    this.initialValue,
    this.isMultiline = false,
    required this.fieldKey,
    this.validator,
    this.onChanged,
  })  : assert(label != null || initialValue != null,
            'Label and initialValue both cannot be null'),
        super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: themeColorStyle.octonaryColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedDefaultTextStyle(
            style: focusNode.hasFocus
                ? textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400)
                : textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: themeColorStyle.secondaryColor,
                  ),
            duration: const Duration(milliseconds: 200),
            child: Text(widget.heading),
          ),
          const SizedBox(height: 16),
          FormBuilderTextField(
            name: widget.fieldKey,
            maxLines: widget.isMultiline ? null : 1,
            focusNode: focusNode,
            onChanged: widget.onChanged,
            validator: widget.validator,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              hintText: widget.label ?? '',
              hintStyle:
                  textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectableDateTile extends StatelessWidget {
  final String title;
  final String? select;
  final VoidCallback onTap;

  const SelectableDateTile({
    Key? key,
    required this.title,
    this.select,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceWidth = context.deviceWidth;
    final bool isEmpty = (select != null);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: themeColorStyle.octonaryColor,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        title: Text(
          title,
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: isEmpty
                ? themeColorStyle.secondaryColor
                : themeColorStyle.tertiaryColor,
          ),
        ),
        trailing: SizedBox(
          width: deviceWidth * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                select ?? 'Select',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isEmpty
                      ? themeColorStyle.secondaryColor
                      : themeColorStyle.tertiaryColor,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableMoodTile extends StatelessWidget {
  final String title;
  final String? select;
  final Color? color;
  final VoidCallback onTap;

  const SelectableMoodTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceWidth = context.deviceWidth;
    final bool isEmpty = (select != null);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: themeColorStyle.octonaryColor,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        title: Text(
          title,
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: isEmpty
                ? themeColorStyle.secondaryColor
                : themeColorStyle.tertiaryColor,
          ),
        ),
        trailing: SizedBox(
          width: deviceWidth * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                select ?? 'Select',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isEmpty
                      ? themeColorStyle.secondaryColor
                      : themeColorStyle.tertiaryColor,
                ),
              ),
              if (isEmpty) ...[
                const SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: color,
                  radius: 7,
                ),
              ],
              const Icon(
                Icons.keyboard_arrow_right,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
