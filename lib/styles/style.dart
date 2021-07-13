import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

/// Centralised style class.
/// Static methods inside, return generic styling
class Style {
  static final Style styleSingleton = Style._internal();
  Style._internal();
  factory Style() => styleSingleton;

  /// Cupertino, Large Title Size, Label Color Text, Bold Style
  static TextStyle largeTitle(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: "SFProDisplay",
      fontStyle: FontStyle.normal,
      fontSize: 34.0,
    );
  }

  /// Cupertino, title Size, Label Color Text, Style
  static TextStyle title(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProDisplay",
      fontStyle: FontStyle.normal,
      fontSize: 28.0,
    );
  }

  /// Cupertino, title Size, Label Color Text, Style
  static TextStyle titleBold(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: "SFProDisplay",
      fontStyle: FontStyle.normal,
      fontSize: 28.0,
    );
  }

  /// Cupertino, title2 Size, Label Color Text, Style
  static TextStyle title2(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProDisplay",
      fontStyle: FontStyle.normal,
      fontSize: 22.0,
    );
  }

  /// Cupertino, Body Size, Label Color Text Style
  static TextStyle body(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProText",
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
    );
  }

  /// Cupertino, Body Size, Secondary Label Color Text Style
  static TextStyle bodySecondary(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.secondaryLabel,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProText",
      fontStyle: FontStyle.normal,
      fontSize: 17.0,
    );
  }

  /// Cupertino, Footer Note Size, Secondary Label Color Text Style
  static TextStyle footerNoteSecondary(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.secondaryLabel,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProText",
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
    );
  }

  /// Cupertino, Footer Note Size, Primary Label Color Text Style
  static TextStyle footerNotePrimary(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProText",
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
    );
  }

  /// Extra Large Title Size, Label Color Text, Bold Style
  @deprecated
  static TextStyle extraLargeTitle(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: "SFProDisplay",
      fontStyle: FontStyle.normal,
      fontSize: 45.0,
    );
  }

  /// For Subtitle in Username Add Sheet
  @deprecated
  static TextStyle subTitle(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProDisplay",
      fontStyle: FontStyle.normal,
      fontSize: 32.0,
    );
  }

  /// For button text in Username Add Sheet
  static TextStyle buttonText(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.white,
        context,
      ),
      fontFamily: "SFProDisplay",
      fontStyle: FontStyle.normal,
      fontSize: 18.0,
    );
  }
}

// Cupertino Icons which are not in cupertino_icons package
// abstract class CupertinoIcons {
//   // Icons._();

//   static const c.IconData preferanceIcon = c.IconData(
//     0xf38b,
//     fontFamily: c.CupertinoIcons.iconFont,
//     fontPackage: c.CupertinoIcons.iconFontPackage,
//   );
// }
