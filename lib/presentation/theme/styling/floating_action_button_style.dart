import 'package:flutter/material.dart';

class FloatingActionButtonStyle extends ThemeExtension<FloatingActionButtonStyle> {
  final Color? primaryFloatingButton;
  final Color? secondaryFloatingButton;

  const FloatingActionButtonStyle({
    required this.primaryFloatingButton,
    required this.secondaryFloatingButton,
  });

  @override
  ThemeExtension<FloatingActionButtonStyle> copyWith(
      {Color? primaryFloatingButton, Color? secondaryFloatingButton}) {
    return FloatingActionButtonStyle(
      primaryFloatingButton: primaryFloatingButton ?? this.primaryFloatingButton,
      secondaryFloatingButton: secondaryFloatingButton ?? this.secondaryFloatingButton,
    );
  }

  @override
  ThemeExtension<FloatingActionButtonStyle> lerp(
      ThemeExtension<FloatingActionButtonStyle>? other, double t) {
    if (other is! FloatingActionButtonStyle) {
      return this;
    }
    return FloatingActionButtonStyle(
      primaryFloatingButton: Color.lerp(primaryFloatingButton, other.primaryFloatingButton, t),
      secondaryFloatingButton: Color.lerp(secondaryFloatingButton, other.secondaryFloatingButton, t),
    );
  }
}