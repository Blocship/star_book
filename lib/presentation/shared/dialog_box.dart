import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    return Center(
      child: SizedBox(
        height: deviceHeight * 0.35,
        child: Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 22),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Image(
                    image: AssetImage('assets/icons/stop.png'), height: 50),
                const SizedBox(height: 30),
                Text(
                  'You’re going to delete this note!',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: themeColorStyle.secondaryColor),
                ),
                const SizedBox(height: 10),
                Text(
                    'By deleting this note you won’t be able to view or edit this note',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color:
                            themeColorStyle.secondaryColor.withOpacity(0.5))),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InactiveFilledButton(
                        onTap: () {
                          context.pop();
                        },
                        label: 'Cancel'),
                    DangerFilledButton(
                      onTap: () => context.pop(),
                      label: 'Delete Note',
                    ),
                  ],
                ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
