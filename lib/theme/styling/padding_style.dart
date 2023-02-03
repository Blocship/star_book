import 'package:flutter/material.dart';

class PaddingStyle extends ThemeExtension<PaddingStyle> {
  final EdgeInsetsGeometry smallPadding;
  final EdgeInsetsGeometry mediumPadding;
  final EdgeInsetsGeometry largePadding;

  const PaddingStyle({
    required this.smallPadding,
    required this.mediumPadding,
    required this.largePadding,
  });

  @override
  ThemeExtension<PaddingStyle> copyWith({
    EdgeInsetsGeometry? smallPadding,
    EdgeInsetsGeometry? mediumPadding,
    EdgeInsetsGeometry? largePadding,
  }) {
    return PaddingStyle(
      smallPadding: smallPadding ?? this.smallPadding,
      mediumPadding: mediumPadding ?? this.mediumPadding,
      largePadding: largePadding ?? this.largePadding,
    );
  }

  @override
  ThemeExtension<PaddingStyle> lerp(
      ThemeExtension<PaddingStyle> other, double t) {
    if (other is! PaddingStyle) {
      return this;
    }
    return PaddingStyle(
      smallPadding:
          EdgeInsetsGeometry.lerp(smallPadding, other.smallPadding, t)!,
      mediumPadding:
          EdgeInsetsGeometry.lerp(mediumPadding, other.mediumPadding, t)!,
      largePadding:
          EdgeInsetsGeometry.lerp(largePadding, other.largePadding, t)!,
    );
  }
}
