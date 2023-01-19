import 'dart:math';

abstract class Util {
  /// [Fast hash function](https://isar.dev/recipes/string_ids.html#fast-hash-function)
  ///
  /// Ideally, your hash function should have high quality
  /// (you don't want collisions) and be fast.
  /// Isar db recommends using the following implementation:
  ///
  /// Avoid using string.hashCode because it is not guaranteed to be stable
  /// across different platforms and versions of Dart.
  ///
  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  static int fnvHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }

  /// Generates Firebase Firestore like 20 char length unique id
  ///
  /// inspiration from: https://stackoverflow.com/q/53301344
  /// and : https://pub.dev/packages/nanoid
  static get uid {
    const alphabet =
        'ModuleSymbhasOwnPr0123456789ABCDEFGHNRVfgctiUvzKqYTJkLxpZXIjQW';
    const len = alphabet.length;
    final random = Random();

    int size = 20;
    String autoId = '';
    while (0 < size--) {
      autoId += alphabet[random.nextInt(len)];
    }
    return autoId;
  }
}

extension XString on String {
  int get fnvHash {
    return Util.fnvHash(this);
  }
}
