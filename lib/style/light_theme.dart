import 'package:flutter/material.dart';
import 'package:star_book/style/tab_bar_theme.dart';
import 'package:star_book/style/theme.dart';
import '../utils/screen_size.dart';

class SbLightTheme extends SbTheme {
  SbLightTheme._internal();
  static final _singleton = SbLightTheme._internal();
  factory SbLightTheme() => _singleton;

  static const headingFontFamily = 'JosefinSans';
  static const bodyFontFamily = 'Raleway';
  static const inputFontFamily = 'Roboto';

  static const primaryBackgroundColor = Colors.white;
  static const secondaryBackgroundColor = Color(0xFF8DCCDB);
  static const tertiaryBackgroundColor = Color(0xFFF9F9F9);
  static const tileBackgroundColor = Color.fromRGBO(244, 244, 244, 1);

  static const primaryLabelColor = Color(0xFF625A5A);
  static const secondaryLabelColor = Color(0xFF8DCCDB);
  static const tertiaryLabelColor = Color(0xFFF6B435);
  static const quaternaryLabelColor = Color(0xFFADADAD);
  static const invertLabelColor = Colors.white;

  // for note , navigation/back
  static const double primaryBodyTextSize = 16;
  // for tile title
  static const double primaryTileTextSize = 17;
  // for buttons
  static const double secondaryBodyTextSize = 15;
  // for attributes
  static const double tertiaryBodyTextSize = 14;
  // for mood,
  static const double primaryHeadingSize = 35;
  // other
  static const double secondaryHeadingSize = 22;
  // dialog caption
  static const double tertiaryHeadingSize = 25;
  static const double textStyleHeight = 1.5;

  @override
  ThemeData getTheme(BuildContext context) {
    return ThemeData(
      // App Mode
      brightness: Brightness.light,
      // App Background
      scaffoldBackgroundColor: primaryBackgroundColor,
      // SbNavigationBar
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBackgroundColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: headingFontFamily,
            fontSize: primaryHeadingSize,
            color: secondaryLabelColor,
            fontWeight: FontWeight.w400,
          ),
          bodyText1: TextStyle(
            fontFamily: bodyFontFamily,
            fontSize: primaryBodyTextSize,
            color: primaryLabelColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        iconTheme: IconThemeData(
          color: primaryLabelColor,
          opacity: 1,
          size: primaryBodyTextSize,
        ),
      ),
      // Text Theme
      textTheme: const TextTheme(
        // for notes
        headline1: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: primaryHeadingSize,
          color: secondaryLabelColor,
          fontWeight: FontWeight.w400,
        ),
        // for other
        headline2: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: secondaryHeadingSize,
          color: tertiaryLabelColor,
        ),
        // About tiles
        headline3: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: primaryBodyTextSize,
          color: primaryLabelColor,
        ),
        // attributes title
        headline4: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: tertiaryBodyTextSize,
          color: invertLabelColor,
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: secondaryHeadingSize,
          color: primaryLabelColor,
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: secondaryHeadingSize,
          color: invertLabelColor,
          fontWeight: FontWeight.w400,
        ),
        caption: TextStyle(fontSize: tertiaryHeadingSize, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: SbLightTheme.headingFontFamily),

        subtitle1: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: primaryTileTextSize,
          color: primaryLabelColor,
          fontWeight: FontWeight.w500,
        ),
        subtitle2: TextStyle(
          fontFamily: headingFontFamily,
          fontSize: tertiaryBodyTextSize,
          color: quaternaryLabelColor,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          fontFamily: bodyFontFamily,
          fontSize: primaryBodyTextSize,
          color: primaryLabelColor,
          height: textStyleHeight,
        ),
        // mood text
        bodyText2: TextStyle(
          fontFamily: bodyFontFamily,
          fontSize: primaryBodyTextSize,
          color: secondaryLabelColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  SbTabBarThemeData tabBarTheme(BuildContext context) {
    return SbTabBarThemeData(
      tabBarDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: secondaryLabelColor),
      ),
      selectedTabDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: secondaryLabelColor,
      ),
      unselectedTabDecoration: null,
      selectedTabLabelStyle: const TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: tertiaryBodyTextSize,
        color: invertLabelColor,
        fontWeight: FontWeight.normal,
      ),
      unselectedTabLabelStyle: const TextStyle(
        fontFamily: bodyFontFamily,
        fontSize: tertiaryBodyTextSize,
        color: secondaryLabelColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Size moodButtonSize(BuildContext context) {
    switch (screenWidth(context)) {
      case ScreenSize.small:
        return const Size(140, 50);
      default:
        return const Size(150.12, 51.2);
    }
  }

  OutlinedButtonThemeData moodButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.any(_interactiveStates.contains)) {
              return secondaryBackgroundColor;
            }
            return primaryBackgroundColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.any(_interactiveStates.contains)) {
              return invertLabelColor;
            }
            return primaryLabelColor;
          },
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: secondaryBackgroundColor,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontFamily: bodyFontFamily,
            fontSize: secondaryBodyTextSize,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(12),
        ),
      ),
    );
  }

  OutlinedButtonThemeData doneButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.any(_interactiveStates.contains)) {
              return secondaryBackgroundColor;
            }
            return primaryBackgroundColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.any(_interactiveStates.contains)) {
              return invertLabelColor;
            }
            return primaryLabelColor;
          },
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: secondaryBackgroundColor,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            color: secondaryLabelColor,
            fontFamily: bodyFontFamily,
            fontSize: primaryBodyTextSize,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(12),
        ),
      ),
    );
  }

  ElevatedButtonThemeData moodFlatButtonTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(secondaryLabelColor),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(1),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontFamily: bodyFontFamily,
            fontSize: tertiaryBodyTextSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        ),
      ),
    );
  }

  ElevatedButtonThemeData attributeButtonTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryBackgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(secondaryLabelColor),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(3),
        shadowColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(0, 0, 0, 0.25)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontFamily: headingFontFamily,
            fontSize: tertiaryBodyTextSize,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
      ),
    );
  }

  ElevatedButtonThemeData dialogButtonTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(SbLightTheme.secondaryLabelColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        elevation: MaterialStateProperty.all<double>(3),
        shadowColor: MaterialStateProperty.all<Color>(Colors.black45),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontFamily: SbLightTheme.bodyFontFamily,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
        ),
      ),
    );
  }

  static const Set<MaterialState> _interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
}
