import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/filled_button_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class PrimaryFilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const PrimaryFilledButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    final CustomButtonTheme customButtonTheme = context.customButtonTheme;
    return SizedBox(
      width: deviceWidth,
      height: deviceHeight * 0.052,
      child: ElevatedButton(
        onPressed: onTap,
        style: customButtonTheme.primaryFilledButtonTheme,
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
