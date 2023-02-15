import 'package:flutter/material.dart';

class DoughnutChartStyle extends ThemeExtension<DoughnutChartStyle> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;
  final Color quinaryColor;
  final Color octonaryColor;

  const DoughnutChartStyle({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.quinaryColor,
    required this.octonaryColor,
  });

  @override
  ThemeExtension<DoughnutChartStyle> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
    Color? quinaryColor,
    Color? octonaryColor,
  }) {
    return DoughnutChartStyle(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
      quinaryColor: quinaryColor ?? this.quinaryColor,
      octonaryColor: octonaryColor ?? this.octonaryColor,
    );
  }

  @override
  ThemeExtension<DoughnutChartStyle> lerp(
      ThemeExtension<DoughnutChartStyle>? other, double t) {
    if (other is! DoughnutChartStyle) {
      return this;
    }
    return DoughnutChartStyle(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      quaternaryColor: Color.lerp(quaternaryColor, other.quaternaryColor, t)!,
      quinaryColor: Color.lerp(quinaryColor, other.quinaryColor, t)!,
      octonaryColor: Color.lerp(octonaryColor, other.octonaryColor, t)!,
    );
  }
}
