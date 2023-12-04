import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSettings implements FreshInstall {
  Future<void> clear();
}

class AppSettingsImpl implements AppSettings {
  final SharedPreferences _pref;

  AppSettingsImpl(SharedPreferences preferences) : _pref = preferences;

  @override
  bool get isFreshInstall => _pref.getBool(FreshInstall.key) ?? true;

  @override
  String get userId => _pref.getString(FreshInstall.userIdKey) ?? '';

  @override
  Future<void> setFreshInstalled() async {
    await _pref.setBool(FreshInstall.key, false);
  }

  @override
  Future<void> setUserId(String userId) async {
    await _pref.setString(FreshInstall.userIdKey, userId);
  }

  @override
  Future<void> clear() async {
    await _pref.clear();
  }
}

abstract class FreshInstall {
  static const String key = 'isFreshInstall';
  static const String userIdKey = 'userId';

  bool get isFreshInstall;

  String get userId;

  Future<void> setFreshInstalled();

  Future<void> setUserId(String userId);
}
