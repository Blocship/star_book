import 'package:flutter/cupertino.dart' as c;

abstract class Style {
  // static fileds for common styling
  // static const TextStyle productRowItemName = TextStyle(
  //   color: Color.fromRGBO(0, 0, 0, 0.8),
  //   fontSize: 18,
  //   fontStyle: FontStyle.normal,
  //   fontWeight: FontWeight.normal,
  // );
}

// Cupertino Icons which are not in cupertino_icons package
abstract class CupertinoIcons {
  // Icons._();

  static const c.IconData preferanceIcon = c.IconData(
    0xf38b,
    fontFamily: c.CupertinoIcons.iconFont,
    fontPackage: c.CupertinoIcons.iconFontPackage,
  );
}
