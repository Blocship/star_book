import 'package:flutter/material.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/tile.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class LockTypeScreen extends StatelessWidget {
  const LockTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: const PrimaryAppBar(
        centerTitle: 'App Lock',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              'Lock Type',
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColorStyle.secondaryColor,
                height: 2.5,
              ),
            ),
            Text(
              'Please select type of lock you want to use',
              style: textTheme.labelLarge!
                  .copyWith(fontWeight: FontWeight.w400, height: 1.5),
            ),
            const SizedBox(height: 30),
            const AppLockTile(title: 'PIN Lock'),
            const SizedBox(height: 30),
            const AppLockTile(title: 'Fingerprint'),
          ],
        ),
      ),
    );
  }
}
