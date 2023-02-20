import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;

  const PrimaryTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color:
                  Theme.of(context).extension<ThemeColorStyle>()!.tertiaryColor,
            ),
        isDense: true,
        contentPadding: const EdgeInsets.all(16.0),
        filled: true,
        fillColor: Theme.of(context).extension<ThemeColorStyle>()!.quinaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:
                Theme.of(context).extension<ThemeColorStyle>()!.octonaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:
                Theme.of(context).extension<ThemeColorStyle>()!.octonaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:
                Theme.of(context).extension<ThemeColorStyle>()!.octonaryColor,
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
  const CustomTextFormField({
    Key? key,
    required this.heading,
    this.label,
    this.initialValue,
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
    controller.text = widget.initialValue ?? '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          AnimatedDefaultTextStyle(
            style: focusNode.hasFocus
                ? Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    )
                : Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .extension<ThemeColorStyle>()!
                          .secondaryColor,
                    ),
            duration: const Duration(milliseconds: 200),
            child: Text(widget.heading),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: 306,
                height: 40,
                child: TextFormField(
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  focusNode: focusNode,
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: widget.label ?? '',
                    hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              );
            },
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
    final selectedData = select ?? 'Select';
    final bool isEmpty = (selectedData != 'Select');
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Theme.of(context).extension<ThemeColorStyle>()!.octonaryColor,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w400,
                color: isEmpty
                    ? Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .secondaryColor
                    : Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .tertiaryColor,
              ),
        ),
        trailing: SizedBox(
          width: screenWidth * 0.19,
          child: Row(
            children: [
              Text(
                selectedData,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .extension<ThemeColorStyle>()!
                          .tertiaryColor,
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
