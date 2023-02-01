import 'package:flutter/material.dart';
import 'package:star_book/theme/base_theme.dart';

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
    );
  }

  @override
  FontTheme get fontTheme {
    return const FontTheme(
      heading1: TextStyle(),
      heading2: TextStyle(),
      heading3: TextStyle(),
      body1: TextStyle(),
      body2: TextStyle(),
      caption: TextStyle(),
    );
  }

  @override
  FontFamily get fontFamily {
    return FontFamily(
      primary: 'primary',
    );
  }
}
