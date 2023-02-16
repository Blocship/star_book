const kDefaultFlavor = 'prod';

enum Env {
  development('dev'),
  production(kDefaultFlavor);

  final String value;
  const Env(this.value);

  factory Env.raw(String value) => Env.values.firstWhere(
        (e) => e.value == value,
        orElse: () => throw UnimplementedError('Env $value is not supported'),
      );
}

class Config {
  // https://github.com/flutter/flutter/issues/55870
  static const String _flavor =
      String.fromEnvironment('flavor', defaultValue: kDefaultFlavor);

  final Env env;
  final String cacheDirectory;

  static final Config _instance = Config.define();
  factory Config() => _instance;
  Config._internal({required this.env, required this.cacheDirectory});

  factory Config.define() {
    switch (Env.raw(_flavor)) {
      case Env.development:
        return _DevelopmentConfig();
      case Env.production:
        return _ProductionConfig();
    }
  }

  bool get isDevelopment => env == Env.development;
  bool get isProduction => env == Env.production;

  @override
  String toString() {
    return 'Config{env: $env, cacheDirectory: $cacheDirectory}';
  }
}

class _DevelopmentConfig extends Config {
  _DevelopmentConfig()
      : super._internal(
          env: Env.development,
          cacheDirectory: '/dev',
        );
}

class _ProductionConfig extends Config {
  _ProductionConfig()
      : super._internal(
          env: Env.production,
          cacheDirectory: '/prod',
        );
}
