import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/floating_action_button_style.dart';

class PrimaryFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const PrimaryFloatingActionButton({
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
      elevation: 0,
      onPressed: onTap,
      child: child,
    );
  }
}

class SecondaryFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const SecondaryFloatingActionButton({
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
