import 'package:flutter/material.dart';

class PrimaryFloatingActionButtonStyle extends ThemeExtension<PrimaryFloatingActionButtonStyle> {
  final Color? backgroundColor;
  final Color? foregroundColor;

  const PrimaryFloatingActionButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  ThemeExtension<PrimaryFloatingActionButtonStyle> copyWith(
      {Color? backgroundColor, Color? foregroundColor}) {
    return PrimaryFloatingActionButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }

  @override
  ThemeExtension<PrimaryFloatingActionButtonStyle> lerp(
      ThemeExtension<PrimaryFloatingActionButtonStyle>? other, double t) {
    if (other is! PrimaryFloatingActionButtonStyle) {
      return this;
    }
    return PrimaryFloatingActionButtonStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
    );
  }
}


class SecondaryFloatingActionButtonStyle extends ThemeExtension<SecondaryFloatingActionButtonStyle> {
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SecondaryFloatingActionButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  ThemeExtension<SecondaryFloatingActionButtonStyle> copyWith(
      {Color? backgroundColor, Color? foregroundColor}) {
    return SecondaryFloatingActionButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }

  @override
  ThemeExtension<SecondaryFloatingActionButtonStyle> lerp(
      ThemeExtension<SecondaryFloatingActionButtonStyle>? other, double t) {
    if (other is! SecondaryFloatingActionButtonStyle) {
      return this;
    }
    return SecondaryFloatingActionButtonStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
    );
  }
}
