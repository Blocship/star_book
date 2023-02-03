
import 'package:flutter/material.dart';

class CustomButtonTheme
    extends ThemeExtension<CustomButtonTheme> {
  final ButtonStyle primaryFilledButtonTheme;
  final ButtonStyle dangerFilledButtonTheme;
  final ButtonStyle inactiveFilledButtonTheme;

  const CustomButtonTheme({
    required this.dangerFilledButtonTheme,
    required this.inactiveFilledButtonTheme,
    required this.primaryFilledButtonTheme,
  });

  @override
  ThemeExtension<CustomButtonTheme> copyWith({
    ButtonStyle? primaryFilledButtonTheme,
    ButtonStyle? dangerFilledButtonTheme,
    ButtonStyle? inactiveFilledButtonTheme,
  }) {
    return CustomButtonTheme(
      primaryFilledButtonTheme:
          primaryFilledButtonTheme ?? this.primaryFilledButtonTheme,
      dangerFilledButtonTheme:
          dangerFilledButtonTheme ?? this.dangerFilledButtonTheme,
      inactiveFilledButtonTheme:
          inactiveFilledButtonTheme ?? this.inactiveFilledButtonTheme,
    );
  }

  @override
  ThemeExtension<CustomButtonTheme> lerp(
      ThemeExtension<CustomButtonTheme>? other, double t) {
    if (other is! CustomButtonTheme) {
      return this;
    }
    return CustomButtonTheme(
      primaryFilledButtonTheme: ButtonStyle.lerp(
          primaryFilledButtonTheme, other.primaryFilledButtonTheme, t)!,
      dangerFilledButtonTheme: ButtonStyle.lerp(
          dangerFilledButtonTheme, other.dangerFilledButtonTheme, t)!,
      inactiveFilledButtonTheme: ButtonStyle.lerp(
          inactiveFilledButtonTheme, other.inactiveFilledButtonTheme, t)!,
    );
  }
}