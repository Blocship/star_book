import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/floating_action_button_style.dart';

class SBPrimaryFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const SBPrimaryFloatingActionButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context)
          .extension<FloatingActionButtonStyle>()!
          .primaryFloatingButton!,
      onPressed: onTap,
      child: child,
    );
  }
}

class SBSecondaryFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const SBSecondaryFloatingActionButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context)
          .extension<FloatingActionButtonStyle>()!
          .secondaryFloatingButton!,
      onPressed: onTap,
      child: child,
    );
  }
}