import 'package:flutter/material.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class AppLockScreen extends StatelessWidget {
  const AppLockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return Scaffold(
      appBar: const PrimaryAppBar(
        centerTitle: 'App Lock',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          children: [
            SizedBox(height: deviceHeight * 0.3),
            const Icon(
              Icons.lock_person_outlined,
              size: 28,
            ),
            Text(
              'Oops! Looks Like You Didn’t Setup Pin',
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColorStyle.secondaryColor,
                height: 2.5,
              ),
            ),
            Text(
              'Click “Setup PIN” below to setup your pin',
              style: textTheme.labelLarge!
                  .copyWith(fontWeight: FontWeight.w400, height: 1.5),
            ),
            const Spacer(),
            PrimaryFilledButton(onTap: () {}, label: 'Setup PIN'),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
