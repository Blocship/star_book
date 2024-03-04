import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/filled_button_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class PrimaryFilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color? color;
  const PrimaryFilledButton({
    super.key,
    required this.onTap,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    final CustomButtonTheme customButtonTheme = context.customButtonTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return SizedBox(
      width: deviceWidth,
      height: deviceHeight * 0.052,
      child: ElevatedButton(
        onPressed: onTap,
        style: customButtonTheme.primaryFilledButtonTheme.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(
              (color != null) ? color! : themeColorStyle.primaryColor),
        ),
        child: Text(label),
      ),
    );
  }
}

class DangerFilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const DangerFilledButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final CustomButtonTheme customButtonTheme = context.customButtonTheme;

    return SizedBox.fromSize(
      size: const Size(125, 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: customButtonTheme.dangerFilledButtonTheme,
        child: Text(label),
      ),
    );
  }
}

class InactiveFilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const InactiveFilledButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final CustomButtonTheme customButtonTheme = context.customButtonTheme;

    return SizedBox.fromSize(
      size: const Size(125, 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: customButtonTheme.inactiveFilledButtonTheme,
        child: Text(label),
      ),
    );
  }
}
