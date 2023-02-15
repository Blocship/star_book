import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/filled_button_style.dart';

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
    return SizedBox.fromSize(
      size: const Size(306, 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: Theme.of(context)
            .extension<CustomButtonTheme>()!
            .primaryFilledButtonTheme,
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
    return SizedBox.fromSize(
      size: const Size(125, 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: Theme.of(context)
            .extension<CustomButtonTheme>()!
            .dangerFilledButtonTheme,
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
    return SizedBox.fromSize(
      size: const Size(125, 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: Theme.of(context)
            .extension<CustomButtonTheme>()!
            .inactiveFilledButtonTheme,
        child: Text(label),
      ),
    );
  }
}
