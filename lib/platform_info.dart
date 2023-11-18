import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

abstract class PlatformInfo {
  FirebaseOptions get options;

  factory PlatformInfo() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _AndroidPlatformInfo();
      case TargetPlatform.iOS:
        return _IosPlatformInfo();
      default:
        throw UnsupportedError(
          'PlatformInfo is not supported for this platform.',
        );
    }
  }
}

class _AndroidPlatformInfo implements PlatformInfo {
  @override
  final FirebaseOptions options = const FirebaseOptions(
    apiKey: const String.fromEnvironment('apiKey'),
    appId: const String.fromEnvironment('appIdAndroid'),
    messagingSenderId: const String.fromEnvironment('messagingSenderId'),
    projectId: const String.fromEnvironment('projectId'),
    storageBucket: const String.fromEnvironment('storageBucket'),
  );
}

class _IosPlatformInfo implements PlatformInfo {
  @override
  final FirebaseOptions options = const FirebaseOptions(
    apiKey: const String.fromEnvironment('apiKey'),
    appId: const String.fromEnvironment('appIdIos'),
    messagingSenderId: const String.fromEnvironment('messagingSenderId'),
    projectId: const String.fromEnvironment('projectId'),
    storageBucket: const String.fromEnvironment('storageBucket'),
    iosBundleId: const String.fromEnvironment('iosBundleId'),
  );
}
