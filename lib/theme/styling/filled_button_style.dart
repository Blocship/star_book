
import 'package:flutter/material.dart';

class SBButtonTheme
    extends ThemeExtension<SBButtonTheme> {
  final ButtonStyle? primaryFilledButtonTheme;
  final ButtonStyle? dangerFilledButtonTheme;
  final ButtonStyle? inactiveFilledButtonTheme;

  const SBButtonTheme({
    required this.dangerFilledButtonTheme,
    required this.inactiveFilledButtonTheme,
    required this.primaryFilledButtonTheme,
  });

  @override
  ThemeExtension<SBButtonTheme> copyWith({
    ButtonStyle? primaryFilledButtonTheme,
    ButtonStyle? dangerFilledButtonTheme,
    ButtonStyle? inactiveFilledButtonTheme,
  }) {
    return SBButtonTheme(
      primaryFilledButtonTheme:
          primaryFilledButtonTheme ?? this.primaryFilledButtonTheme,
      dangerFilledButtonTheme:
          dangerFilledButtonTheme ?? this.dangerFilledButtonTheme,
      inactiveFilledButtonTheme:
          inactiveFilledButtonTheme ?? this.inactiveFilledButtonTheme,
    );
  }

  @override
  ThemeExtension<SBButtonTheme> lerp(
      ThemeExtension<SBButtonTheme>? other, double t) {
    if (other is! SBButtonTheme) {
      return this;
    }
    return SBButtonTheme(
      primaryFilledButtonTheme: ButtonStyle.lerp(
          primaryFilledButtonTheme, other.primaryFilledButtonTheme, t),
      dangerFilledButtonTheme: ButtonStyle.lerp(
          dangerFilledButtonTheme, other.dangerFilledButtonTheme, t),
      inactiveFilledButtonTheme: ButtonStyle.lerp(
          inactiveFilledButtonTheme, other.inactiveFilledButtonTheme, t),
    );
  }
}