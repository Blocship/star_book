import 'package:flutter/material.dart';
import 'package:star_book/firebase.dart';
import 'package:star_book/presentation/service/logger.dart';

class LoggerNavigatorObserver extends NavigatorObserver {
  /// The [Navigator] pushed `route`.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AnalyticsService().logEvent(
        'Route Pushed', <String, dynamic>{'screen': route.settings.name});
    SbLog().v('Route Pushed — ${route.settings.name}');
  }

  /// The [Navigator] popped `route`.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AnalyticsService().logEvent(
        'Route Popped', <String, dynamic>{'screen': route.settings.name});
    SbLog().v('Route Popped — ${route.settings.name}');
  }

  /// The [Navigator] removed `route`.
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AnalyticsService().logEvent(
        'Route Removed', <String, dynamic>{'screen': route.settings.name});
    SbLog().v('Route Removed — ${route.settings.name}');
  }

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    AnalyticsService().logEvent(
        'Route Replaced', <String, dynamic>{'screen': newRoute?.settings.name});
    SbLog().v('Route Replaced — ${newRoute?.settings.name ?? ""}');
  }

  /// The [Navigator]'s routes are being moved by a user gesture.
  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {}

  /// User gesture is no longer controlling the [Navigator].
  @override
  void didStopUserGesture() {}
}
