part of 'routes.dart';

extension XBuildContext on BuildContext {
  void goToScreen({required RouteArg arg}) {
    AnalyticsService().logEvent(
      'go_to_screen',
      <String, dynamic>{
        'screen': arg.parsedPath,
      },
    );
    go(arg.parsedPath);
  }

  void pushScreen({required RouteArg arg}) {
    AnalyticsService().logEvent(
      'push_screen',
      <String, dynamic>{
        'screen': arg.parsedPath,
      },
    );
    push(arg.parsedPath);
  }

  String get location => GoRouter.of(this).location;

  void shouldPop() {
    if (canPop()) {
      AnalyticsService().logEvent(
        'pop_screen',
        <String, dynamic>{
          'screen': location,
        },
      );
      pop();
    }
  }
}
