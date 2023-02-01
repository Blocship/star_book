import 'package:flutter/material.dart';

abstract class SBFlatButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SBFlatButton({Key? key, this.onTap}) : super(key: key);

  Widget childWidget();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: childWidget(),
    );
  }
}

class SBPrimaryFlatButton extends SBFlatButton {
  final Widget? child;
  final String? label;

  const SBPrimaryFlatButton({
    this.child,
    this.label,
    final VoidCallback? onTap,
    Key? key,
  })  : assert((label == null) ^ (child == null)),
        super(onTap: onTap, key: key);

  @override
  Widget childWidget() {
    return FittedBox(
      child: child ??
          Text(
            label!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
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
