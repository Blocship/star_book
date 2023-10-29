import 'dart:developer';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:star_book/presentation/shared/force_update_dialog.dart';

class RemoteConfigKey {
  static const String androidEnforcedVersion = 'androidEnforcedVersion';
  static const String iosEnforcedVersion = 'iosEnforcedVersion';
}

class ForceAppUpdate {
  static Future<void> enforcedVersion(BuildContext context) async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 12),
      ),
    );
    try {
      final _key = Platform.isIOS
          ? RemoteConfigKey.iosEnforcedVersion
          : RemoteConfigKey.androidEnforcedVersion;
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final _currentVersion = packageInfo.version;
      await remoteConfig.fetchAndActivate();
      final _enforcedVersion = remoteConfig.getString(_key);
      final int currentVersion =
          int.tryParse(_currentVersion.replaceAll('.', '')) ?? 0;
      final int enforcedVersion =
          int.tryParse(_enforcedVersion.replaceAll('.', '')) ?? 0;
      if (enforcedVersion > currentVersion) {
        if (context.mounted) {
          await _forceAppUpdateDialogBox(context);
        }
        return;
      }
    } catch (exception) {
      log('Error on Remote Config: $exception');
    }
  }

  static Future<void> _forceAppUpdateDialogBox(context) async {
    Future<bool> onBackButton() async {
      SystemNavigator.pop();
      return false;
    }

    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => onBackButton(),
          child: const ForceAppUpdateDialog(),
        );
      },
    );
  }
}
