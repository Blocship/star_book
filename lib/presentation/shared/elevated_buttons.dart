import 'package:flutter/material.dart';

abstract class SBElevatedButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SBElevatedButton({Key? key, this.onTap}) : super(key: key);

  Widget childWidget();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: childWidget(),
    );
  }
}

class SBPrimaryElevatedButton extends SBElevatedButton {
  final Widget? child;
  final String? label;

  const SBPrimaryElevatedButton({
    this.child,
    this.label,
    final VoidCallback? onTap,
    Key? key,
  })  : assert((label == null) ^ (child == null)),
        super(onTap: onTap, key: key);

  @override
  Widget childWidget() {
    return FittedBox(
      child: child ?? Text(label!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(306, 40),
      child: super.build(context),
    );
  }
}
