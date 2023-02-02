import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/filled_button_style.dart';

class SBPrimaryFilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const SBPrimaryFilledButton({
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
            .extension<SBButtonTheme>()!
            .primaryFilledButtonTheme,
        child: Text(label),
      ),
    );
  }
}

class SBDangerFilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const SBDangerFilledButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(120, 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: Theme.of(context)
            .extension<SBButtonTheme>()!
            .dangerFilledButtonTheme,
        child: Text(label),
      ),
    );
  }
}

class SBInactiveFilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const SBInactiveFilledButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(120, 40),
      child: ElevatedButton(
        onPressed: onTap,
        style: Theme.of(context)
            .extension<SBButtonTheme>()!
            .inactiveFilledButtonTheme,
        child: Text(label),
      ),
    );
  }
}
