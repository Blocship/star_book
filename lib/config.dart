import 'dart:developer';

const kDefaultFlavor = 'prod';

enum Environment {
  staging('qa'),
  production(kDefaultFlavor);

  final String value;
  const Environment(this.value);

  factory Environment.from(String value) => Environment.values.firstWhere(
        (e) => e.value == value,
        orElse: () => throw UnimplementedError('Env $value is not supported'),
      );
}

// https://github.com/flutter/flutter/issues/55870
final Environment kEnvironment = Environment.from(
    const String.fromEnvironment('flavor', defaultValue: kDefaultFlavor));

extension XEnvironment on Environment {
  bool get isProd => this == Environment.production;
  bool get isStaging => this == Environment.staging;

  void maybeWhen({
    Function()? prod,
    Function()? staging,
    Function()? orElse,
  }) {
    switch (this) {
      case Environment.production:
        prod?.call() ?? orElse?.call();
        break;
      case Environment.staging:
        staging?.call() ?? orElse?.call();
        break;
    }
  }

  /// The [map] method allows mapping different values
  ///  based on the current environment.
  T map<T>({
    required T Function() prod,
    required T Function() staging,
  }) {
    switch (this) {
      case Environment.production:
        return prod();
      case Environment.staging:
        return staging();
    }
  }
}

abstract class Config {
  Environment get env;
  String get cacheDirectory;
  String get appSettingsDirectory;

  factory Config() {
    log('App is running in ${kEnvironment.toString()} environment');
    return kEnvironment.map(
      prod: () => _ProdAppConfig(),
      staging: () => _StagingAppConfig(),
    );
  }

  @override
  String toString() {
    return 'Config{env: $env, cacheDirectory: $cacheDirectory}';
  }
}

class _StagingAppConfig implements Config {
  @override
  final String appSettingsDirectory = '/qa';

  @override
  final String cacheDirectory = '/qa';

  @override
  final Environment env = Environment.staging;
}

class _ProdAppConfig implements Config {
  @override
  final String appSettingsDirectory = '/prod';

  @override
  final String cacheDirectory = '/prod';

  @override
  final Environment env = Environment.production;
}
