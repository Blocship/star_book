import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/floating_action_button_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

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
    final FloatingActionButtonStyle floatingActionButtonStyle =
        context.floatingActionButtonStyle;
    return FloatingActionButton(
      backgroundColor: floatingActionButtonStyle.primaryFloatingButton!,
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
    final FloatingActionButtonStyle floatingActionButtonStyle =
        context.floatingActionButtonStyle;
    return FloatingActionButton(
      backgroundColor: floatingActionButtonStyle.secondaryFloatingButton!,
      elevation: 0,
      onPressed: onTap,
      child: child,
    );
  }
}
