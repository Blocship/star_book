import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/gradient_scaffold_style.dart';

class ForegroundTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;
  final Color quinary;

  const ForegroundTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.quinary,
    // senary, septenary, octonary, nonary, denary
  });
}

class BackgroundTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;

  const BackgroundTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
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
  ForegroundTheme get foregroundTheme;

  BackgroundTheme get backgroundTheme;

  FontTheme get fontTheme;

  FontFamily get fontFamily;

  GradientScaffoldStyle get gradientScaffoldStyle;

  ThemeData get theme {
    return ThemeData(
      primaryColor: foregroundTheme.primaryColor,
      appBarTheme: AppBarTheme(
        color: foregroundTheme.primaryColor,
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
      },
    );
  }
}
