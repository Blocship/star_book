import 'package:flutter/material.dart';

class PrimaryFilledButtonTheme extends ThemeExtension<PrimaryFilledButtonTheme> {
  final ButtonStyle? primaryFilledButtonTheme;

  const PrimaryFilledButtonTheme({
    required this.primaryFilledButtonTheme,
  });

  @override
  ThemeExtension<PrimaryFilledButtonTheme> copyWith(
      {ButtonStyle? primaryFilledButtonTheme}) {
    return PrimaryFilledButtonTheme(
      primaryFilledButtonTheme: primaryFilledButtonTheme ?? this.primaryFilledButtonTheme,
    );
  }

  @override
  ThemeExtension<PrimaryFilledButtonTheme> lerp(
      ThemeExtension<PrimaryFilledButtonTheme>? other, double t) {
    if (other is! PrimaryFilledButtonTheme) {
      return this;
    }
    return PrimaryFilledButtonTheme(
      primaryFilledButtonTheme: ButtonStyle.lerp(primaryFilledButtonTheme, other.primaryFilledButtonTheme, t),
    );
  }
}

class DangerFilledButtonTheme extends ThemeExtension<DangerFilledButtonTheme> {
  final ButtonStyle? dangerFilledButtonTheme;

  const DangerFilledButtonTheme({
    required this.dangerFilledButtonTheme,
  });

  @override
  ThemeExtension<DangerFilledButtonTheme> copyWith(
      {ButtonStyle? dangerFilledButtonTheme}) {
    return DangerFilledButtonTheme(
      dangerFilledButtonTheme: dangerFilledButtonTheme ?? this.dangerFilledButtonTheme,
    );
  }

  @override
  ThemeExtension<DangerFilledButtonTheme> lerp(
      ThemeExtension<DangerFilledButtonTheme>? other, double t) {
    if (other is! DangerFilledButtonTheme) {
      return this;
    }
    return DangerFilledButtonTheme(
      dangerFilledButtonTheme: ButtonStyle.lerp(dangerFilledButtonTheme, other.dangerFilledButtonTheme, t),
    );
  }
}

class InactiveFilledButtonTheme extends ThemeExtension<InactiveFilledButtonTheme> {
  final ButtonStyle? inactiveFilledButtonTheme;

  const InactiveFilledButtonTheme({
    required this.inactiveFilledButtonTheme,
  });

  @override
  ThemeExtension<InactiveFilledButtonTheme> copyWith(
      {ButtonStyle? inactiveFilledButtonTheme}) {
    return InactiveFilledButtonTheme(
      inactiveFilledButtonTheme: inactiveFilledButtonTheme ?? this.inactiveFilledButtonTheme,
    );
  }

  @override
  ThemeExtension<InactiveFilledButtonTheme> lerp(
      ThemeExtension<InactiveFilledButtonTheme>? other, double t) {
    if (other is! InactiveFilledButtonTheme) {
      return this;
    }
    return InactiveFilledButtonTheme(
      inactiveFilledButtonTheme: ButtonStyle.lerp(inactiveFilledButtonTheme, other.inactiveFilledButtonTheme, t),
    );
  }
}
