import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;

  const PrimaryTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return TextFormField(
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
  const CustomTextFormField({
    Key? key,
    required this.heading,
    this.label,
    this.initialValue,
    this.isMultiline = false,
  })  : assert(label != null || initialValue != null,
            'Label and initialValue both cannot be null'),
        super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode focusNode = FocusNode();

  final TextEditingController controller = TextEditingController();

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
          TextFormField(
            maxLines: widget.isMultiline ? null : 1,
            focusNode: focusNode,
            controller: controller,
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

class SelectableTile extends StatelessWidget {
  final String title;
  final String? select;
  final VoidCallback onTap;

  const SelectableTile({
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
    final selectedData = select ?? 'Select';
    final bool isEmpty = (selectedData != 'Select');
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
          width: deviceWidth * 0.19,
          child: Row(
            children: [
              Text(
                selectedData,
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: themeColorStyle.tertiaryColor,
                ),
              ),
              const SizedBox(width: 4),
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
