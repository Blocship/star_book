import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;

  const GradientScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          body,
          const Positioned(
            top: 80,
            right: -10,
            child: OrangeShadow(
              shadowWidth: 180,
              shadowHeight: 240,
              borderRadius: 200,
              spreadRadius: 100,
              blurRadius: 80,
              shadowOpacity: 0.17,
            ),
          ),
          const Positioned(
            top: 200,
            right: 30,
            child: OrangeShadow(
              shadowWidth: 40,
              shadowHeight: 40,
              borderRadius: 120,
              spreadRadius: 120,
              blurRadius: 80,
              shadowOpacity: 0.1,
            ),
          ),
          const Positioned(
            bottom: 10,
            child: BlueShadow(
              shadowWidth: 360,
              shadowHeight: 300,
              borderRadius: 120,
              spreadRadius: 120,
              blurRadius: 80,
              shadowOpacity: 0.17,
            ),
          ),
          const Positioned(
            bottom: 220,
            left: 140,
            child: BlueShadow(
              shadowWidth: 40,
              shadowHeight: 40,
              borderRadius: 120,
              spreadRadius: 40,
              blurRadius: 100,
              shadowOpacity: 0.1,
            ),
          ),
          const Positioned(
            top: 380,
            left: 160,
            child: PinkShadow(
              shadowWidth: 20,
              shadowHeight: 20,
              borderRadius: 120,
              spreadRadius: 30,
              blurRadius: 35,
              shadowOpacity: 0.08,
            ),
          ),
        ],
      ),
    );
  }
}

class OrangeShadow extends StatelessWidget {
  final double shadowWidth;
  final double shadowHeight;
  final double borderRadius;
  final double spreadRadius;
  final double blurRadius;
  final double shadowOpacity;

  const OrangeShadow({
    Key? key,
    required this.shadowWidth,
    required this.shadowHeight,
    required this.borderRadius,
    required this.spreadRadius,
    required this.blurRadius,
    required this.shadowOpacity,
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
            color: const Color(0xffFF833D).withOpacity(shadowOpacity),
          )
        ],
      ),
    );
  }
}

class BlueShadow extends StatelessWidget {
  final double shadowWidth;
  final double shadowHeight;
  final double borderRadius;
  final double spreadRadius;
  final double blurRadius;
  final double shadowOpacity;

  const BlueShadow({
    Key? key,
    required this.shadowWidth,
    required this.shadowHeight,
    required this.borderRadius,
    required this.spreadRadius,
    required this.blurRadius,
    required this.shadowOpacity,
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
            color: const Color(0xff57D7FF).withOpacity(shadowOpacity),
          )
        ],
      ),
    );
  }
}

class PinkShadow extends StatelessWidget {
  final double shadowWidth;
  final double shadowHeight;
  final double borderRadius;
  final double spreadRadius;
  final double blurRadius;
  final double shadowOpacity;

  const PinkShadow({
    Key? key,
    required this.shadowWidth,
    required this.shadowHeight,
    required this.borderRadius,
    required this.spreadRadius,
    required this.blurRadius,
    required this.shadowOpacity,
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
            color: const Color(0xffF400F9).withOpacity(shadowOpacity),
          )
        ],
      ),
    );
  }
}
