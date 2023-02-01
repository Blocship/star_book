import 'package:flutter/material.dart';

class SBFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color color;
  const SBFloatingActionButton({
    super.key,
    required this.onTap,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: color,
      onPressed: onTap,
      child: child,
    );
  }
}
