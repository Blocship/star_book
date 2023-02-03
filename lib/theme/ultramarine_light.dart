import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:star_book/theme/base_theme.dart';
import 'package:star_book/theme/styling/floating_action_button_style.dart';
import 'package:star_book/theme/styling/filled_button_style.dart';
import 'package:star_book/theme/styling/gradient_scaffold_style.dart';
import 'package:star_book/theme/styling/padding_style.dart';

/// Ultramarine is a deep blue color pigment which was originally made by
/// grinding lapis lazuli into a powder.
/// The name comes from the Latin ultramarinus, literally 'beyond the sea',
/// because the pigment was imported into Europe from mines in Afghanistan
/// by Italian traders during the 14th and 15th centuries.
///
/// Ultramarine was the finest and most expensive blue used by Renaissance painters.
class UltramarineLightTheme extends BaseTheme {
  @override
  BackgroundTheme get backgroundTheme {
    return const BackgroundTheme(
      primaryColor: Color(0xFFFFFFFF),
      secondaryColor: Color(0xFF1F1F1F),
      tertiaryColor: Color(0x1F1F1F08),
      quaternaryColor: Color(0xFFF1F2F4),
      senary: Color(0xff32C74F),
    );
  }

  @override
  ForegroundTheme get foregroundTheme {
    return const ForegroundTheme(
      primaryColor: Color(0xFF4C4DFF),
      secondaryColor: Color(0xFF1F1F1F),
      tertiaryColor: Color(0xFF8B8B8B),
      quaternaryColor: Color(0xFF7B7CFF),
      quinary: Color(0xFFFFFFFF),
      senary: Color(0xFFFF3932),
      septenary: Color(0xFFF1F2F4),
    );
  }

  @override
  FontTheme get fontTheme {
    return FontTheme(
      heading1: const TextStyle(
        fontSize: 30,
        letterSpacing: -1,
      ),
      heading2: TextStyle(
        fontSize: 25,
        letterSpacing: -1,
        height: 1.8,
        color: foregroundTheme.secondaryColor,
      ),
      heading3: const TextStyle(
        fontSize: 20,
        height: 1.4,
      ),
      body1: TextStyle(
        fontSize: 16,
        color: foregroundTheme.tertiaryColor,
      ),
      body2: TextStyle(
        fontSize: 14,
        height: 1.0,
        color: foregroundTheme.tertiaryColor,
      ),
      caption: const TextStyle(
        fontSize: 12,
      ),
    );
  }

  @override
  FontFamily get fontFamily {
    return FontFamily(
      primary: 'Inter',
    );
  }

  @override
  GradientScaffoldStyle get gradientScaffoldStyle {
    return const GradientScaffoldStyle(
      primaryColor: Color(0xff57D7FF),
      secondaryColor: Color(0xffFF833D),
      tertiaryColor: Color(0xffF400F9),
    );
  }

  @override
  FloatingActionButtonStyle get floatingActionButtonStyle {
    return FloatingActionButtonStyle(
      primaryFloatingButton: foregroundTheme.primaryColor,
      secondaryFloatingButton: backgroundTheme.senary,
    );
  }

  @override
  CustomButtonTheme get customButtonTheme {
    return CustomButtonTheme(
      primaryFilledButtonTheme: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(foregroundTheme.primaryColor),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        foregroundColor:
            MaterialStateProperty.all<Color>(foregroundTheme.quinary),
        textStyle: MaterialStateProperty.all<TextStyle>(
            fontTheme.body2.copyWith(fontWeight: FontWeight.w500)),
      ),
      dangerFilledButtonTheme: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(foregroundTheme.senary),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        foregroundColor:
            MaterialStateProperty.all<Color>(foregroundTheme.quinary),
        textStyle: MaterialStateProperty.all<TextStyle>(
            fontTheme.body2.copyWith(fontWeight: FontWeight.w500)),
      ),
      inactiveFilledButtonTheme: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(backgroundTheme.quaternaryColor),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        foregroundColor:
            MaterialStateProperty.all<Color>(foregroundTheme.tertiaryColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
            fontTheme.body2.copyWith(fontWeight: FontWeight.w500)),
      ),
    );
  }

  @override
  PaddingStyle get paddingStyle {
    log('Testing');
    return const PaddingStyle(
      smallPadding: EdgeInsets.only(top: 10, bottom: 10),
      mediumPadding: EdgeInsets.only(top: 30, bottom: 30),
      largePadding: EdgeInsets.only(top: 50, bottom: 50),
    );
  }
}
