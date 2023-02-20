import 'package:flutter/material.dart';

class ThemeColorStyle extends ThemeExtension<ThemeColorStyle> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;
  final Color quinaryColor;
  final Color senaryColor;
  final Color septenaryColor;
  final Color octonaryColor;
  final Color nonaryColor;

  const ThemeColorStyle({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.quinaryColor,
    required this.senaryColor,
    required this.septenaryColor,
    required this.octonaryColor,
    required this.nonaryColor,
    //   nonary, denary
  });

  @override
  ThemeExtension<ThemeColorStyle> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
    Color? quinaryColor,
    Color? senaryColor,
    Color? septenaryColor,
    Color? octonaryColor,
    Color? nonaryColor,
  }) {
    return ThemeColorStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
      quinaryColor: quinaryColor ?? this.quinaryColor,
      senaryColor: senaryColor ?? this.senaryColor,
      septenaryColor: septenaryColor ?? this.septenaryColor,
      octonaryColor: octonaryColor ?? this.octonaryColor,
      nonaryColor: nonaryColor ?? this.nonaryColor,
    );
  }

  @override
  ThemeExtension<ThemeColorStyle> lerp(
      ThemeExtension<ThemeColorStyle>? other, double t) {
    if (other is! ThemeColorStyle) {
      return this;
    }
    return ThemeColorStyle(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      quaternaryColor: Color.lerp(quaternaryColor, other.quaternaryColor, t)!,
      quinaryColor: Color.lerp(quinaryColor, other.quinaryColor, t)!,
      senaryColor: Color.lerp(senaryColor, other.senaryColor, t)!,
      septenaryColor: Color.lerp(septenaryColor, other.septenaryColor, t)!,
      octonaryColor: Color.lerp(octonaryColor, other.octonaryColor, t)!,
      nonaryColor: Color.lerp(nonaryColor, other.nonaryColor, t)!,
    );
  }
}
