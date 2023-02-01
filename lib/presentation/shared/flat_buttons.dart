import 'package:flutter/material.dart';

abstract class SBFlatButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SBFlatButton({Key? key, this.onTap}) : super(key: key);

  Widget childWidget();

  ThemeData theme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = theme(context).elevatedButtonTheme.style;
    return ElevatedButton(
      onPressed: onTap,
      style: buttonStyle,
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
  // @override
  // ThemeData theme(BuildContext context) {
  // return Theme.of(context).copyWith(
  //     elevatedButtonTheme:
  // }

  @override
  Widget childWidget() {
    return FittedBox(child: child ?? Text(label!));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size(300, 52),
      child: super.build(context),
    );
  }
}
