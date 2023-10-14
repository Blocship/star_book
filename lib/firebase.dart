import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:star_book/config.dart';
import 'package:star_book/platform_info.dart';

abstract class FirebaseService {
  Future<void> initialise();

  factory FirebaseService() {
    if (kEnvironment.isProd) {
      final options = PlatformInfo().options;
      return _ProdFirebaseService(options: options);
    }
    return _StagingFirebaseService();
  }
}

class _ProdFirebaseService implements FirebaseService {
  FirebaseOptions options;

  _ProdFirebaseService({required this.options});

  @override
  Future<void> initialise() async {
    await Firebase.initializeApp(name: options.projectId, options: options);
  }
}

class _StagingFirebaseService implements FirebaseService {
  @override
  Future<void> initialise() async {}
}

abstract class ReportingService {
  Future<void> initialise();
  void recordFlutterFatalError(FlutterErrorDetails details);
  bool recordError(Object exception, StackTrace stackTrace);
  Future<bool> enableReporting(bool enable);
  Future<void> test();

  factory ReportingService() {
    if (kEnvironment.isProd) {
      return _ProdReportingService();
    }
    return _StagingReportingService();
  }
}

class _ProdReportingService implements ReportingService {
  final FlutterExceptionHandler _recordFlutterFatalError =
      FirebaseCrashlytics.instance.recordFlutterError;

  @override
  Future<void> initialise() async {
    FlutterError.onError = _recordFlutterFatalError;
    PlatformDispatcher.instance.onError = recordError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  @override
  void recordFlutterFatalError(FlutterErrorDetails details) {
    _recordFlutterFatalError.call(details);
  }

  @override
  bool recordError(Object exception, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    return true;
  }

  @override
  Future<bool> enableReporting(bool enable) async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(enable);
    return enable;
  }

  @override
  Future<void> test() async {
    throw Exception('Test exception');
  }
}

class _StagingReportingService implements ReportingService {
  @override
  Future<void> initialise() async {}

  @override
  void recordFlutterFatalError(FlutterErrorDetails details) {}

  @override
  bool recordError(Object exception, StackTrace stackTrace) {
    return true;
  }

  @override
  Future<bool> enableReporting(bool enable) async {
    return false;
  }

  @override
  Future<void> test() async {}
}

abstract class AnalyticsService {
  Future<void> initialise();
  Future<void> logEvent(String name, Map<String, dynamic> parameters);

  factory AnalyticsService() {
    if (kEnvironment.isProd) {
      return _ProdAnalyticsService();
    }
    return _StagingAnalyticsService();
  }
}

class _ProdAnalyticsService implements AnalyticsService {
  @override
  Future<void> initialise() async {}

  @override
  Future<void> logEvent(String name, Map<String, dynamic> parameters) async {
    await FirebaseAnalytics.instance
        .logEvent(name: name, parameters: parameters);
  }
}

class _StagingAnalyticsService implements AnalyticsService {
  @override
  Future<void> initialise() async {}

  @override
  Future<void> logEvent(String name, Map<String, dynamic> parameters) async {}
}
