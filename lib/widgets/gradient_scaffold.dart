import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/gradient_scaffold_style.dart';

class GradientScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  const GradientScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 80,
            right: -10,
            child: BlurShadow(
              shadowWidth: 180,
              shadowHeight: 240,
              borderRadius: 200,
              spreadRadius: 100,
              blurRadius: 80,
              shadowOpacity: 0.17,
              color: Theme.of(context)
                  .extension<GradientScaffoldStyle>()!
                  .secondaryColor!
                  .withOpacity(0.17),
            ),
          ),
          Positioned(
            top: 200,
            right: 30,
            child: BlurShadow(
              shadowWidth: 40,
              shadowHeight: 40,
              borderRadius: 120,
              spreadRadius: 120,
              blurRadius: 80,
              shadowOpacity: 0.1,
              color: Theme.of(context)
                  .extension<GradientScaffoldStyle>()!
                  .secondaryColor!
                  .withOpacity(0.1),
            ),
          ),
          Positioned(
            bottom: 10,
            child: BlurShadow(
              shadowWidth: 360,
              shadowHeight: 300,
              borderRadius: 120,
              spreadRadius: 120,
              blurRadius: 80,
              shadowOpacity: 0.17,
              color: Theme.of(context)
                  .extension<GradientScaffoldStyle>()!
                  .primaryColor!
                  .withOpacity(0.17),
            ),
          ),
          Positioned(
            bottom: 220,
            left: 140,
            child: BlurShadow(
              shadowWidth: 40,
              shadowHeight: 40,
              borderRadius: 120,
              spreadRadius: 40,
              blurRadius: 100,
              shadowOpacity: 0.1,
              color: Theme.of(context)
                  .extension<GradientScaffoldStyle>()!
                  .primaryColor!
                  .withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 380,
            left: 160,
            child: BlurShadow(
              shadowWidth: 20,
              shadowHeight: 20,
              borderRadius: 120,
              spreadRadius: 30,
              blurRadius: 35,
              shadowOpacity: 0.08,
              color: Theme.of(context)
                  .extension<GradientScaffoldStyle>()!
                  .tertiaryColor!
                  .withOpacity(0.08),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ],
      ),
    );
  }
}

class BlurShadow extends StatelessWidget {
  final double shadowWidth;
  final double shadowHeight;
  final double borderRadius;
  final double spreadRadius;
  final double blurRadius;
  final double shadowOpacity;
  final Color color;

  const BlurShadow({
    Key? key,
    required this.shadowWidth,
    required this.shadowHeight,
    required this.borderRadius,
    required this.spreadRadius,
    required this.blurRadius,
    required this.shadowOpacity,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: shadowWidth,
      height: shadowHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            color: color,
          ),
        ],
      ),
    );
  }
}
