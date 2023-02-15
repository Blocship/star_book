import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/floating_action_button_style.dart';
import 'package:star_book/theme/styling/filled_button_style.dart';
import 'package:star_book/theme/styling/gradient_scaffold_style.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';

class BackgroundTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;
  final Color senary;
  const BackgroundTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.senary,
  });
}

class FontTheme {
  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle caption;

  const FontTheme({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.body1,
    required this.body2,
    required this.caption,
  });
}

class FontFamily {
  final String primary;

  FontFamily({
    required this.primary,
  });
}

abstract class BaseTheme {
  ThemeColorStyle get themeColorStyle;

  BackgroundTheme get backgroundTheme;

  FontTheme get fontTheme;

  FontFamily get fontFamily;

  CustomButtonTheme get customButtonTheme;

  GradientScaffoldStyle get gradientScaffoldStyle;

  FloatingActionButtonStyle get floatingActionButtonStyle;

  ThemeData get theme {
    return ThemeData(
      primaryColor: themeColorStyle.primaryColor,
      fontFamily: fontFamily.primary,
      appBarTheme: AppBarTheme(
        color: themeColorStyle.primaryColor,
      ),
      textTheme: TextTheme(
        //  displayLarge: ,
        //  displayMedium:,
        //  displaySmall:,
        headlineLarge: fontTheme.heading1,
        headlineMedium: fontTheme.heading2,
        headlineSmall: fontTheme.heading3,
        //  titleLarge:,
        //  titleMedium:,
        //  titleSmall:,
        bodyLarge: fontTheme.body1,
        bodyMedium: fontTheme.body2,
        //  bodySmall:,
        labelLarge: fontTheme.body2,
        // labelMedium: ,
        //  labelSmall: ,
      ),
      extensions: <ThemeExtension<dynamic>>{
        gradientScaffoldStyle,
        customButtonTheme,
        floatingActionButtonStyle,
        themeColorStyle,
      },
    );
  }
}
