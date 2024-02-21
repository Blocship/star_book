import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_book/presentation/theme/styling/gradient_scaffold_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class GradientScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;

  const GradientScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GradientScaffoldStyle gradientScaffoldStyle =
        context.gradientScaffoldStyle;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return Container(
      color: themeColorStyle.quinaryColor,
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
              color: gradientScaffoldStyle.secondaryColor!.withOpacity(0.17),
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
              color: gradientScaffoldStyle.secondaryColor!.withOpacity(0.1),
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
              color: gradientScaffoldStyle.primaryColor!.withOpacity(0.17),
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
              color: gradientScaffoldStyle.primaryColor!.withOpacity(0.1),
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
              color: gradientScaffoldStyle.tertiaryColor!.withOpacity(0.08),
            ),
          ),
          Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
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
