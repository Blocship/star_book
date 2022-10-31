import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_book/models/mood/mood.dart';
import 'package:star_book/service/cache_client.dart';
import 'package:star_book/service/logger.dart';

abstract class _Key {
  static const String username = 'username';
  // static const String tutorial = 'tutorial';
  static const String usernameTutorial = 'usernameTutorial';
  static const String notificationTutorial = 'notificationTutorial';
  static const String exploreOptionClickCount = 'exploreOptionClickCount';
  static const String review = 'review';
  static const String notificationSubscribed = 'notificationSubscribed';
  static const String crashlyticsSubscribed = 'crashlyticsSubscribed';
  static const String prayerSetting = 'prayerSetting';
  static const String prefsBoxKey = 'preference';
  static const String todayHadith = 'todayHadith';
  static const String checkStatus = 'checkStatus';

  // create default value map
  static Map<String, dynamic> defaultValues = {
    _Key.username: '',
    _Key.usernameTutorial: false,
    _Key.notificationTutorial: false,
    _Key.exploreOptionClickCount: 0,
    _Key.review: false,
    _Key.notificationSubscribed: false,
    _Key.crashlyticsSubscribed: false,
    _Key.todayHadith: '',
    _Key.checkStatus: false,
  };
}

/// To store flags/preferances/settings/interactivity of user locally.
/// if you are using custom data type, then make sure to register it's hive adapter
/// before accessing it.
class Preference implements CacheClient {
  static final Preference _preference = Preference._();
  factory Preference() => _preference;
  Preference._();

  static late final Box _instance;

  static Future<void> init() async {
    try {
      _instance = await Hive.openBox(_Key.prefsBoxKey);
      return;
    } catch (error, stackTrace) {
      SbLog().e('Preference.init', error, stackTrace);
      // TODO: use oh no dailog and send report.
      rethrow;
    }
  }

  // TODO: Get Hadith out of the box using the key defined above
  static String get todayHadith {
    try {
      return _instance.get(_Key.todayHadith);
    } catch (error, stackTrace) {
      SbLog().e('Preference.todayHadith', error, stackTrace);
      rethrow;
    }
  }

// todo: it's costly to use this method, refactor it later
  static bool get checkStatus {
    try {
      return _instance.get(_Key.checkStatus,
          defaultValue: _Key.defaultValues[_Key.checkStatus]) as bool;
    } catch (error, stackTrace) {
      SbLog().e('Preference.checkStatus', error, stackTrace);
      rethrow;
    }
  }

  static String get username {
    return _instance.get(_Key.username,
        defaultValue: _Key.defaultValues[_Key.username]) as String;
  }

  static bool get shouldAskForUsername {
    if (username.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static bool get isUsernameTutorialDone {
    return _instance.get(_Key.usernameTutorial,
        defaultValue: _Key.defaultValues[_Key.usernameTutorial]) as bool;
  }

  static bool get isNotificationTutorialDone {
    return _instance.get(_Key.notificationTutorial,
        defaultValue: _Key.defaultValues[_Key.notificationTutorial]) as bool;
  }

  static int get exploreOptionClickCount {
    return _instance.get(_Key.exploreOptionClickCount,
        defaultValue: _Key.defaultValues[_Key.exploreOptionClickCount]) as int;
  }

  static bool get isNotificationSubscribed {
    return _instance.get(_Key.notificationSubscribed,
        defaultValue: _Key.defaultValues[_Key.notificationSubscribed]) as bool;
  }

  static bool get isCrashlyticsSubscribed {
    return _instance.get(_Key.crashlyticsSubscribed,
        defaultValue: _Key.defaultValues[_Key.crashlyticsSubscribed]) as bool;
  }

  static bool get isReviewDone {
    return _instance.get(_Key.review,
        defaultValue: _Key.defaultValues[_Key.review]) as bool;
  }

  Mood readPrayerSettings() {
    // keep this comment, I (Shahzad) will implement some default values later.
    // return _instance.get(_Key.prayerSetting, defaultValue: _Key.defaultValues[_Key.review]) as PrayerSetting;
    String? rawJson = _instance.get(_Key.prayerSetting) as String?;
    if (rawJson == null) {
      return Mood.initial();
    } else {
      return Mood.fromJson(jsonDecode(rawJson));
    }
  }

  static bool shouldAskForReview() {
    if (isReviewDone) {
      return false;
    } else if (exploreOptionClickCount > 10) {
      return true;
    } else {
      return false;
    }
  }

  static Future setUsername(String name) async {
    SbLog().v('Name set to: $name');
    await _instance.put(_Key.username, name);
  }

  // TODO: Add set today hadith in hive box
  static Future setTodayHadithId(String id) async {
    await _instance.put(_Key.todayHadith, id);
  }

// todo: it's costly to use this method, refactor it later
  static Future setCheckStatus(bool value) async {
    await _instance.put(_Key.checkStatus, value);
  }

  static Future setCrashlyticsSubscribed(value) async {
    await _instance.put(_Key.crashlyticsSubscribed, value);
  }

  static Future setReviewDone(bool value) async {
    SbLog().v('setting  Review done to  $value');
    _instance.put(_Key.review, value);
  }

  static Future setUsernameTutorialDone(bool value) async {
    SbLog().v('setting  Review done to  $value');
    await _instance.put(_Key.usernameTutorial, value);
  }

  static Future setNotificationTutorialDone(bool value) async {
    await _instance.put(_Key.notificationTutorial, value);
  }

  static Future exploreOptionClicked() async {
    await _instance.put(
        _Key.exploreOptionClickCount, exploreOptionClickCount + 1);
    SbLog()
        .v('incrementing exploreOptionClickCount : $exploreOptionClickCount');
  }

  static Future resetExploreOptionClicked() async {
    if (exploreOptionClickCount > 10) {
      SbLog().v('resetting exploreOptionClickCount to 0');
      await _instance.put(_Key.exploreOptionClickCount, 0);
    }
  }

  static Future setIsNotificationSubscribed(value) async {
    await _instance.put(_Key.notificationSubscribed, value);
  }

  Future writePrayerSettings({required Mood prayerSetting}) async {
    await _instance.put(_Key.prayerSetting, jsonEncode(prayerSetting.toJson()));
  }

  // static bool get isTutorialDone {
  //   return _instance.get(_Key.tutorial) as bool? ?? false;
  // }

  // static void setTutorialDone(bool value) async {
  //   await _instance.setBool(_Key.tutorial, value);
  // }

  static void reset() {
    setUsername('');
    setUsernameTutorialDone(false);
    setNotificationTutorialDone(false);
    resetExploreOptionClicked();
    setIsNotificationSubscribed(false);
    setCrashlyticsSubscribed(true);
    setReviewDone(false);
  }

  @override
  Object readData({required String key}) {
    // TODO: implement readData
    throw UnimplementedError();
  }

  @override
  Future writeData({required Object object, required String key}) {
    // TODO: implement writeData
    throw UnimplementedError();
  }
}