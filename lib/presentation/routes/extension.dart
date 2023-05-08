part of 'routes.dart';

extension XBuildContext on BuildContext {
  void goToScreen({required RouteArg arg}) {
    go(arg.parsedPath);
  }

  void pushScreen({required RouteArg arg}) {
    push(arg.parsedPath);
  }

  String get location => GoRouter.of(this).location;

  void shouldPop() {
    if (canPop()) {
      pop();
    }
  }
}
