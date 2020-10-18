import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

abstract class Style {
  /// Cupertino, Footer Note Text Style
  static TextStyle footerNoteStyle(BuildContext context) {
    return TextStyle(
      color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.secondaryLabel, context),
      fontWeight: FontWeight.w400,
      fontFamily: "SFProText",
      fontStyle: FontStyle.normal,
      fontSize: 13.0,
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
