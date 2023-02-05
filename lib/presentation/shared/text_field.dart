import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;

  const PrimaryTextField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.85,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context)
                    .extension<ThemeColorStyle>()!
                    .tertiaryColor,
              ),
          isDense: true,
          contentPadding: const EdgeInsets.all(12.0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

/// - Make GenericTextField
/// - Active and Inactive Concept
/// - Use Animation
// class JournalTextField extends StatelessWidget {
//   final String hintText;
//   final String header;
//   // final _fieldKey = GlobalKey();
//   const JournalTextField({
//     Key? key,
//     required this.hintText,
//     required this.header,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // final textHeight = _fieldKey.currentContext!.findRenderObject() as  RenderBox;
//     return Container(
//       width: 306,
//       // height: textHeight.size.height,
//       height: 80,
//       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 14),
//           Text(header),
//           const SizedBox(height: 14),
//           SizedBox(
//             width: 306,
//             child: TextFormField(
//               // key: _fieldKey,
//               minLines: 1,
//               maxLines: null,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 isDense: true,
//                 hintText: hintText,
//                 contentPadding: const EdgeInsets.all(0),
//                 border: const OutlineInputBorder(borderSide: BorderSide.none),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class CustomTextFormField extends StatefulWidget {
//   final String heading;
//   final String label;
//
//   const CustomTextFormField({
//     Key? key,
//     required this.heading,
//     required this.label,
//   }) : super(key: key);
//
//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   final FocusNode focusNode = FocusNode();
//   final GlobalKey _formFieldKey = GlobalKey();
//   final TextEditingController controller = TextEditingController();
//   @override
//   void initState() {
//     focusNode.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // log(focusNode.hasFocus.toString());
//     return Container(
//       width: 306,
//       // height: 200,
//       // height: _formFieldKey.currentContext?.size?.height ?? 60,
//       // height: textHeight.size.height,
//       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//       decoration: BoxDecoration(
//         // color: Colors.blue,
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AnimatedDefaultTextStyle(
//             style: focusNode.hasFocus
//                 ? const TextStyle(
//                     fontSize: 18,
//                     color: Colors.red,
//                   )
//                 : const TextStyle(
//                     fontSize: 17,
//                     color: Colors.blue,
//                   ),
//             duration: const Duration(milliseconds: 200),
//             child: Text(widget.heading),
//           ),
//           const SizedBox(height: 8),
//           SizedBox(
//             height: 30,
//             child: TextFormField(
//               // key: _formFieldKey,
//               expands: true,
//               minLines: null,
//               maxLines: null,
//               focusNode: focusNode,
//               controller: controller,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.zero,
//                 isDense: true,
//                 hintText: widget.label,
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class CustomTextFormField extends StatefulWidget {
  final String heading;
  final String label;

  const CustomTextFormField({
    Key? key,
    required this.heading,
    required this.label,
  }) : super(key: key);

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
    return Container(
      width: 306,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedDefaultTextStyle(
            style: focusNode.hasFocus
                ? const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  )
                : const TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                  ),
            duration: const Duration(milliseconds: 200),
            child: Text(widget.heading),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
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
                    hintText: widget.label,
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
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.85,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color:
                Theme.of(context).extension<ThemeColorStyle>()!.octonaryColor,
          ),
        ),
        child: ListTile(
          onTap: onTap,
          dense: true,
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context)
                      .extension<ThemeColorStyle>()!
                      .secondaryColor,
                ),
          ),
          trailing: SizedBox(
            width: screenWidth * 0.19,
            child: Row(
              children: [
                Text(
                  select ?? 'Select',
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
      ),
    );
  }
}
