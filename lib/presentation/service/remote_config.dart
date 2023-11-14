import 'dart:developer';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_book/config.dart';
import 'package:star_book/firebase.dart';
import 'package:star_book/presentation/service/version.dart';
import 'package:star_book/presentation/shared/force_update_dialog.dart';

class ForceAppUpdate {
  static String version = 'enforcedVersion';

  static Future<void> enforcedVersion(BuildContext context) async {
    if (kEnvironment.isProd) {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 12),
        ),
      );
      try {
        final PackageInfo packageInfo = await PackageInfo.fromPlatform();
        final _currentVersion = Version.parse(packageInfo.version);
        await remoteConfig.fetchAndActivate();
        final _enforcedVersion = Version.parse(remoteConfig.getString(version));
        if (_enforcedVersion > _currentVersion) {
          if (context.mounted) {
            await _forceAppUpdateDialogBox(context);
          }
          return;
        }
      } catch (exception, stackTrace) {
        log('Error on Remote Config: $exception');
        ReportingService().recordError(exception, stackTrace);
      }
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
